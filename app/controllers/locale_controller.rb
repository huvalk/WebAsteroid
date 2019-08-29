def return_path controller, action, lang
  "/#{controller}/#{action}?locale=#{lang}"
end


class LocaleController < ApplicationController

  def lang
    unless params[:lang].nil?
      locale = params[:lang]
    end
    redirect_to (return_path params[:cont], params[:act], params[:lang])
  end

end
