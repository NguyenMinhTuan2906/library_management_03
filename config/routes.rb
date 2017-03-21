Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/help", to: "pages#help"
  get "/pages/:page",to: "pages#show"
end
