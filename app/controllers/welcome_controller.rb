class WelcomeController < ApplicationController
  #include 
  def initialize(id, user_id)
        @r = Redis.new
        @id = id
        @user_id = user_id
    end
end
