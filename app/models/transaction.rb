class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
  validates :crypto_id, :user_id, :quantity, presence: true

  def self.get_user_coins(id)
    transHash = Transaction.all.where(user_id: id).group_by {|trx| Crypto.find(trx.crypto_id).name}
    mycurrencies = {}
    transHash.each do |name, values|
      qty = values.map do |value|
        value.quantity
      end
      mycurrencies[name] = qty.reduce(:+)
    end
    mycurrencies
  end

end
