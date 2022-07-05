class Room < ApplicationRecord
    mount_uploader :room_image, ImagesUploader
    belongs_to :user
end
