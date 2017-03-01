class SupplyInfosController < ApplicationController
  before_action :set_supply_infos,only:[:edit,:update]
  def index
  @supplyinfos=SupplyInfo.all
  @supplyinfo=SupplyInfo.new
   @deliveries = Delivery.all
  end
  
    def create
    @supply_infos = SupplyInfo.new(supply_infos_params)
    
    if @supply_infos.save
      redirect_to root_path , notice: '災害物資の保存しました'
    else
        # メッセージが保存できなかった時
       @supplyinfos = SupplyInfo.all
        flash.now[:alert] = "保存失敗しました。"
        render 'index'
      end
  end
  
   def edit
   @supplyinfo=SupplyInfo.find(params[:id])
  end 
  
  def update

    @supply_infos=SupplyInfo.find(params[:id])
   if @supply_infos.update(supply_infos_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to root_path , notice: '災害物資の編集しました'
   else
     @supplyinfos = SupplyInfo.all  
     # 保存に失敗した場合は編集画面へ戻す
     flash.now[:alert] = "編集失敗しました。"
     render 'edit'
   end
 end
  
  def destroy
   @supplyinfo=SupplyInfo.find(params[:id])
    @supplyinfo.destroy
    redirect_to root_path, notice: '削除しました'
  end
  
  def set_supply_infos
    @supplyinfos=SupplyInfo.find(params[:id])
  end
  
  private
  def supply_infos_params
    params.require(:supply_info).permit(:shs_name, :shs_sizeEvent,:shs_goodsSize,
    :shs_Lackofgdsdbox,:shs_Lackofgds,:shs_Surplusitemdbox,:shs_Surplusitem,:shs_note)
  end
end