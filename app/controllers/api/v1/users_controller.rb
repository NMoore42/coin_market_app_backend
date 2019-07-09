class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :delete_user]

  def create
    @user = User.new(user_params)
    if @user.save
      @coins = Transaction.get_user_coins(@user.id)
      @transactions = @user.transactions.reverse
      @articles = @user.articles
      render json: {user: @user, coins: @coins, transactions: @transactions, articles: @articles}
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    @user = User.all.find_by(email: email, password: password)
    if @user
      @coins = Transaction.get_user_coins(@user.id)
      @transactions = @user.transactions.reverse
      @articles = @user.articles
      render json: {user: @user, coins: @coins, transactions: @transactions, articles: @articles}
    else
      @errors = ["Invalid credentials, please try again"]
      render json: @errors
    end
  end

  def delete_user
    @user.destroy
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
