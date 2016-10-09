class Pin < ApplicationRecord
	belongs_to :user
	validates :description, presence: true, length: {maximum: 222}

	has_attached_file :image, styles: { crop: "365x"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	acts_as_votable

	has_many :flags, dependent: :destroy
end
