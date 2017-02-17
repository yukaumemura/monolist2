class ReliefController < ApplicationController
  def Stocklist
    @relief = @relief.new
  end
  
   def create
    @relief = relief.new(relief_params)
    @relief.save
    redirect_to root_path , notice: '物資情報を保存しました'
  end
  
  private
  def relief_params
    params.require(:message).permit(:name, :body)
  end
end
