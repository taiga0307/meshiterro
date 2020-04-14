class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  # Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除される
  has_many :favorites, dependent: :destroy
  attachment :profile_image
end
