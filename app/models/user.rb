require 'pry'

class User < ApplicationRecord
  has_many :articles
  has_many :transactions
  has_many :cryptos, through: :transactions
  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true

  def self.get_article(user_id, url)
    user = User.find(user_id)
    user.articles.find{|article| article.url == url}
  end

end
