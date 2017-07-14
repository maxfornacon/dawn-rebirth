class Pin < ApplicationRecord
	belongs_to :user
	validates :description, presence: true, length: {maximum: 222}

	has_attached_file :image, styles: { crop: "325x"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

	has_many :flags, dependent: :destroy
  acts_as_votable
end
