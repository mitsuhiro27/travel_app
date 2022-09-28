class Room < ApplicationRecord
    mount_uploader :room_image, ImagesUploader

    validates :room_name, presence: true
    validates :room_profile, presence: true, length: {maximum: 300}
    validates :price, presence: true
    validates :address, presence: true
    validates :room_image, presence: true

    belongs_to :user
    has_many :reservations
end
