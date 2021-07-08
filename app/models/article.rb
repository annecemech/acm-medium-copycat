class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_rich_text :rich_body
  has_one_attached :photo
end