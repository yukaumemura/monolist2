class ReliefsController < ApplicationController

  def index
     #新規登録
    @relief = Relief.new
    #在庫管理表の検索
    @q        = Relief.search(params[:q])
    @reliefs = @q.result(distinct: true)
  end
  
  def new
   @relief = Relief.new
  end
  
  def serch
#在庫管理表の検索
  @reliefs = Relief.all
  end
  #在庫管理表への編集
  def create
   @relief =Relief.new(relief_params)
    if @relief.save
      redirect_to root_path , notice: '物資在庫表に新規保存しました'
    else
        # 物資在庫表に保存できなかった時
        @reliefs =Relief.all
        @relief = Relief.new
        flash.now[:alert] = "物資在庫表に保存失敗しました。"
        render 'index'
      end
  end
  #在庫管理表の編集
 def edit
   @relief = Relief.find(params[:id])
  end 
  
 def update

    @relief = Relief.find(params[:id])
   if @relief.update(relief_params)
     # '物資在庫表の対象物を保存に成功した場合はトップページへリダイレクト
     redirect_to root_path , notice: '物資在庫表の対象物を編集しました'
   else
     # '物資在庫表の対象物を保存に失敗した場合は編集画面へ戻す
     render 'edit'
   end
 end
   # '物資在庫表の対象物を削除
  def destroy
    @relief = Relief.find(params[:id])
    @relief.destroy
    redirect_to root_path, notice: '物資在庫表の対象物を削除しました'
  end
  
   def set_reliefs
    @relief = Relief.find(params[:id])
  end

  private
  def relief_params
    params.require(:relief).permit(:gs_name, :gs_sizeEvent,:gs_goodsSize,
    :gs_dbweight,:gs_dbboxcount,:gs_dbboxsize,:gs_BestbeforEnd,:gs_BestbeforeStart,
    :gs_NowNum,:gs_shortages,:gs_ExtraParts,:goos_note)
  end
  
end
