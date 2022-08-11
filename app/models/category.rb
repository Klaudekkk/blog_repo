class Category < ApplicationRecord

  # wiele do wiele implementacja
  has_many :article_categories
  has_many :articles, through: :article_categories
  #####
  validates :name, presence: true, length: {minimum: 3, maximum: 25} #imie nie moze byc pustym stringiem
  validates_uniqueness_of :name # name musi byc unikalne
end