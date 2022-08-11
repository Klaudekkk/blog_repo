class ArticleCategory < ApplicationRecord
  #wiele do wiele
  belongs_to :article
  belongs_to :category
end