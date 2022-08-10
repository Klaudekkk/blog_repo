class Category < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 25} #imie nie moze byc pustym stringiem
  validates_uniqueness_of :name # name musi byc unikalne
end