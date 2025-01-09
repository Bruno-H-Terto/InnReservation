class HomeController < ApplicationController
  def index
    @user = current_user
    begin
      @inns = Inn.all
    rescue => e
      logger.error "Erro: #{e}"
    end
  end
end
