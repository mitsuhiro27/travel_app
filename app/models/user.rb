class User < ApplicationRecord
mount_uploader :avater, AvaterUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true 
  validates :avater,presence: true
  validates :profile,presence: true, on: :update
  validates :name,presence: true, on: :update
  validates :avater,presence: true, on: :update
  validates :profile, length: { maximum: 200 } 
 
  has_many :rooms
  has_many :reservations
  attr_accessor :current_password

end
