class ReliefsController < ApplicationController
  
  def index
   @relief = Relief.all
  end

  def create
   @reliefs =Relief.new(relief_params)
    if @reliefs.save
      redirect_to root_path , notice: '保存しました'
    else
        # メッセージが保存できなかった時
         @reliefs =Relief.all
        flash.now[:alert] = "保存失敗しました。"
        render 'index'
      end
  end
  
  def update
    if @reliefs.update(relief_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: '編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def destroy
   @reliefs.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def message_params
    params.require(:reliefs).permit(:gs_name, :gs_sizeEvent)
  end
  
  
end
