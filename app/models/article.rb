class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public privé),
    message: "%{value} n'est pas une valeur acceptée" }
  has_rich_text :rich_body
  has_one_attached :photo

  before_create :initialize_votes


  def short_description
    self.rich_body.to_plain_text.truncate(80)
  end

  def initialize_votes
    self.votes = 0
  end
end
