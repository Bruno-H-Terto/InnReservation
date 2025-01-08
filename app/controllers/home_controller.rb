class HomeController < ApplicationController
  def index
    @user = current_user
    begin
      @inns = Inn.all
    rescue => e
      logger.error "Erro: #{e}"
      render file: "#{Rails.root}/public/500.html", status: :internal_server_error
    end
  end
end