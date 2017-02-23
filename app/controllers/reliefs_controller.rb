class ReliefsController < ApplicationController
  
  # has_many :products
  # a belongs_to :relief
  def index
    @relief = Relief.new
    @q        = Relief.search(params[:q])
    @reliefs = @q.result(distinct: true)
  end
  
  def new
   @relief = Relief.new
  end
  
  def serch
  @reliefs = Relief.all
  end

  def edit
   @relief = Relief.find(params[:id])
  end
  
  def create
   @relief =Relief.new(relief_params)
    if @relief.save
      redirect_to root_path , notice: '保存しました'
    else
        # メッセージが保存できなかった時
        @reliefs =Relief.all
        @relief = Relief.new
        flash.now[:alert] = "保存失敗しました。"
        render 'index'
      end
  end
  
 def update

    @relief = Relief.find(params[:id])
   if @relief.update(relief_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to root_path , notice: '編集しました'
   else
     # 保存に失敗した場合は編集画面へ戻す
     render 'edit'
   end
 end
  
  def destroy
    @relief = Relief.find(params[:id])
    @relief.destroy
    redirect_to root_path, notice: '削除しました'
  end
  
   def set_reliefs
    @relief = Relief.find(params[:id])
  end

  private
  def relief_params
    params.require(:relief).permit(:gs_ID,:gs_name, :gs_sizeEvent,:gs_goodsSize,
    :gs_dbweight,:gs_dbboxcount,:gs_dbboxsize,:gs_BestbeforEnd,:gs_BestbeforeStart,
    :gs_NowNum,:gs_shortages,:gs_ExtraParts,:goos_note)
  end
  
end
