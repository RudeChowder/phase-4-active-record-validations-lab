class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbaity?

  def clickbaity?
    baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if baits.none? { |bait| title&.include? bait }
      errors.add(:title, "Title is not clickbaity enough")
    end
  end
end
