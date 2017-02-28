class SupplyInfosController < ApplicationController
  before_action :set_supply_infos, only: [:edit, :update]
  def index
  @deliveries = Delivery.all
  @supplyinfos = SupplyInfo.all
  @supplyinfo = SupplyInfo.new
  end
  
  def create
   @supply_infos = SupplyInfo.new(supply_infos_params)
    
   if @supply_infos.save
      redirect_to root_path , notice: '支援物資情報を登録しました'
   else
    # メッセージが保存できなかった時
    @supplyinfos = SupplyInfo.all

    flash.now[:alert] = "保存失敗しました。"
    render 'index'
   end
   
  end
  
  def edit
    @supplyinfo= SupplyInfo.find(params[:id])
  end 
  
 def update

    @supplyinfo= SupplyInfo.find(params[:id])
   if @supplyinfo.update(supply_infos_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to root_path , notice: '配信対象の支援物資を編集しました'
   else
     # 保存に失敗した場合は編集画面へ戻す
     render 'edit'
   end
 end
  
  def destroy
  @supply_info = SupplyInfo.find(params[:id])
  @supply_info.destroy
  redirect_to root_path, notice: '配信対象の支援物資を削除しました'
end
 
  private

 def set_supply_infos
     @supplyinfos= SupplyInfo.find(params[:id])
  end

  def supply_infos_params
    params.require(:supply_info).permit(:shs_name,:shs_sizeEvent,:shs_goodsSize,
    :shs_Lackofgdsdbox, :shs_Lackofgds,:shs_Surplusitemdbox,:shs_Surplusitem,:shs_note)
  end
end

