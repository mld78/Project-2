class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :couplet
  validates :substance, presence: true, length: { minimum: 4, maximum: 350 }
end
