Rails.application.routes.draw do

  devise_for :admins

  SiteController.action_methods.each do |action|
    get "/#{action}", to: "site##{action}", as: "#{action}"
  end

  root to: "site#home"
end
