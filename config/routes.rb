Rails.application.routes.draw do

  devise_for :admins

  SiteController.action_methods.each do |action|
    if action == "contact_us"
      post "/#{action}", to: "site##{action}", as: "#{action}"
    else
      get "/#{action}", to: "site##{action}", as: "#{action}"
    end
  end

  root to: "site#home"
end
