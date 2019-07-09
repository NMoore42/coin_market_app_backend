require_relative '../../../../lib/api_communicator.rb'

class Api::V1::CryptosController < ApplicationController


  def index
    @cryptos = Crypto.all
    if @cryptos.last.updated_at.to_s.slice(0,10) != Time.now.strftime("%F %T").to_s.slice(0,10)
      APICall.get_data.each_value{|data| Crypto.create(data)}
    end
    render json: Crypto.get_week_data
  end

end
