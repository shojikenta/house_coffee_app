class DrinksController < ApplicationController
  before_action :logged_in_user

  def new
    @drink = Drink.new
  end
end
