class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public private),
    message: "%{value} is not a valid argument" }
  has_rich_text :rich_body
  has_one_attached :photo
end
