class Crypto < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  validates :name, :price, :ticker, presence: true

  def self.get_week_data
    Crypto.all.last(70).group_by{|obj|obj.name}
  end

end
