class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :restaurants, through: :comments
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name

  def admin?
    self.role == "admin"
  end
end
