class User < ApplicationRecord
  has_many :couplets, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   has_attached_file :prof,
                    styles: { medium: "152x152#" },
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

             def s3_credentials
                   {
                     bucket: ENV["S3_BUCKET_NAME"],
                     access_key_id: ENV["S3_ACCESS_KEY_ID"],
                     secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
                   }
              end
  validates_attachment_content_type :prof, content_type: /\Aimage\/.*\Z/
end
