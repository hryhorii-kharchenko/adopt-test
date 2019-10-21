class Post < ApplicationRecord

    has_one_attached :photo

    validates :name, presence: true,
                     length: { minimum: 2 }

    validate :photo_must_be_jpg

    def photo_must_be_jpg
        unless photo.present?
            errors.add(:photo, "формату .jpg обов'язково має бути прикріплене")
            return
        end

        unless photo.content_type =~ /^image\/(jpeg|jpg)$/
            errors.add(:photo, "не є зображенням формату .jpg")
        end
    end
end
