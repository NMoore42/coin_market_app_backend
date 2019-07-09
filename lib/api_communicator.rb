require 'rest-client'
require "json"
require_relative "../config.rb"


class APICall

  def self.api_call
    url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,LTC,BCH,ZEC,ADA,XRP,XLM,EOS,TRX,ETH'
    parameters = {
        'convert' => 'USD'
    }
    headers = {
        'Accepts' => 'application/json',
        'X-CMC_PRO_API_KEY' => APIKey.api_key,
        "params" => parameters
    }
    response_string = RestClient.get(url, headers)
    parsed_data = JSON.parse(response_string)
    data= parsed_data["data"]
  end

  def self.get_data
    data = self.api_call
    returnHash = {
      "BTC" => {"name" => "Bitcoin", "price" => data["BTC"]["quote"]["USD"]["price"], "ticker" => "BTC"},
      "LTC" => {"name" => "Litecoin", "price" => data["LTC"]["quote"]["USD"]["price"], "ticker" => "LTC"},
      "BCH" => {"name" => "Bitcoin Cash", "price" => data["BCH"]["quote"]["USD"]["price"], "ticker" => "BCH"},
      "ZEC" => {"name" => "Zcash", "price" => data["ZEC"]["quote"]["USD"]["price"], "ticker" => "ZEC"},
      "ADA" => {"name" => "Cardano", "price" => data["ADA"]["quote"]["USD"]["price"], "ticker" => "ADA"},
      "XRP" => {"name" => "Ripple", "price" => data["XRP"]["quote"]["USD"]["price"], "ticker" => "XRP"},
      "XLM" => {"name" => "Stellar", "price" => data["XLM"]["quote"]["USD"]["price"], "ticker" => "XLM"},
      "EOS" => {"name" => "EOS", "price" => data["EOS"]["quote"]["USD"]["price"], "ticker" => "EOS"},
      "TRX" => {"name" => "TRON", "price" => data["TRX"]["quote"]["USD"]["price"], "ticker" => "TRX"},
      "ETH" => {"name" => "Ethereum", "price" => data["ETH"]["quote"]["USD"]["price"], "ticker" => "ETH"}
    }
  end

end
