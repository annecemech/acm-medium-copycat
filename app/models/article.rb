class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public private),
    message: "%{value} is not a valid argument" }
  has_rich_text :rich_body
  has_one_attached :photo


  def short_description
    self.rich_body.to_plain_text.truncate(80)
  end
end
