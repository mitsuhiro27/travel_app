class Room < ApplicationRecord
    mount_uploader :room_image, ImagesUploader
    belongs_to :user
    has_many :reservations
end
