class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @drink = Drink.find(params[:drink_id])
    @user = @drink.user
    current_user.favorite(@drink)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @drink = Drink.find(params[:drink_id])
    current_user.favorites.find_by(drink_id: @drink.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def index
    @favorites = current_user.favorites
  end
end
