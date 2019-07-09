class Api::V1::TransactionsController < ApplicationController
  before_action :find_transaction, only: [:ticker]

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :accepted
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def ticker
    render json: @transaction.crypto.ticker
  end


  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :crypto_id, :quantity, :coin)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

end
