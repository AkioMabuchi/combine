Rails.application.routes.draw do
  root "home#top"

  get "/signup", to: "home#signup_form"

  post "/logout", to: "users#logout"
  get "/auth/twitter/callback", to: "users#twitter"
  get "/auth/failure", to: "users#auth_failure"
  post "/twitter", to: "users#twitter_post"

  get "/settings", to: "users#settings_form"
  post "/settings/update/profile", to: "users#update_profile"
  post "/settings/update/theme_image", to: "users#update_theme_image"
  get "/settings/done", to: "users#settings_done"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
