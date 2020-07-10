class DrinksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def new
    @drink = Drink.new
  end

  def index
  end

  def show
    @drink = Drink.find(params[:id])
    @comment = Comment.new
  end

  def create
    @drink = current_user.drinks.build(drink_params)
    if @drink.save
      flash[:success] = "コーヒーレシピが登録されました！"
      redirect_to drink_path(@drink)
    else
      render 'drinks/new'
    end
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(drink_params)
      flash[:success] = "コーヒーレシピ情報が更新されました！"
      redirect_to @drink
    else
      render 'edit'
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    if current_user.admin? || current_user?(@drink.user)
      @drink.destroy
      flash[:success] = "コーヒーレシピが削除されました"
      redirect_to request.referrer == user_url(@drink.user) ? user_url(@drink.user) : root_url
    else
      flash[:danger] = "他人のコーヒーレシピは削除できません"
      redirect_to root_url
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name,
                                  :discription,
                                  :portion,
                                  :tips,
                                  :reference,
                                  :required_time,
                                  :made_memo,
                                  :picture)
  end

  def correct_user
    @drink = current_user.drinks.find_by(id: params[:id])
    redirect_to root_url if @drink.nil?
  end
end
