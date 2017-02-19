class ReliefsController < ApplicationController
 def index
 #@reliefs = Relief.new
 @reliefs = Relief.all
 end


  def create
     @reliefs = Relief.new(message_params)
    @reliefs.save
    redirect_to root_path , notice: '物資を新規登録しました'
  end

  private
  def  reliefs_params
    params.require(:reliefs).permit(:gs_name, :gs_sizeEvent,:gs_goodsSize,:gs_dbweight,:gs_dbboxcount)
  end
  ## ここまで
end

