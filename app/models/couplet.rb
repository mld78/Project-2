class Couplet < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user

    # adds the ability to attach an image to a newly created couplet
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
