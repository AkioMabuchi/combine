class UsersController < ApplicationController
  protect_from_forgery :except => ["logout","twitter_post"]

  before_action :does_exist_user, only: [:show]
  before_action :authenticate_user, only: [
      :settings_form, :settings_done
  ]
  def logout
    session[:user_id] = nil
    redirect_to("/signup")
  end

  def show
    @user = User.find_by(permalink: params[:permalink])
  end

  def settings_form
    if @current_user.id == Rails.application.credentials.admin[:id]
      @is_admin = true
    end
  end

  def update_profile

  end

  def update_theme_image
    if params[:password] == Rails.application.credentials.admin[:password]
      theme_image = ThemeImage.new(
          name: params[:name],
          image: params[:image]
      )
      if theme_image.save
        redirect_to("/settings")
      else
        flash[:notice] = "画像のアップロードに失敗しました"
        redirect_to("/settings")
      end
    else
      flash[:notice] = "管理者用のパスワードが違います"
      redirect_to("/settings")
    end
  end

  def settings_done

  end
  def twitter
    auth_hash = request.env["omniauth.auth"]
    @provider = auth_hash[:provider]
    @twitter_uid = auth_hash[:uid]
    @name = auth_hash[:info][:name]
    @image = auth_hash[:info][:image]
    @description = auth_hash[:info][:description]
    @twitter_url = auth_hash[:info][:urls][:Twitter]
  end

  def twitter_post
    if params[:provider] == "twitter"
      user = User.find_by(twitter_uid: params[:twitter_uid])
      if user
        session[:user_id] = user.id
        redirect_to("/")
      else
        new_user = User.new(
            permalink: generate_permalink,
            twitter_uid: params[:twitter_uid],
            name: params[:name],
            remote_image_url: params[:image],
            description: params[:description],
            twitter_url: params[:twitter_url]
        )

        if new_user.save
          session[:user_id] = new_user.id
          redirect_to("/")
        else
          redirect_to("/")
        end
      end
    else
      redirect_to("/")
    end
  end

  def auth_failure
    flash[:notice] = "SNS認証に失敗しました"
    redirect_to("/")
  end

  private

  def generate_permalink
    r = ""
    (1..12).each do
      r += rand(36).to_s(36)
    end
    return r
  end
end
