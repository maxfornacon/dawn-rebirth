class Pin < ApplicationRecord
	belongs_to :user, counter_cache: true
	validates :description, presence: true, length: {maximum: 222}, unless: ->(pin){pin.heading.present? or pin.subheading.present?}
	validates :heading, presence: true, length: {maximum: 33}, unless: ->(pin){pin.description.present? or pin.subheading.present?}
	validates :subheading, presence: true, length: {maximum: 33},unless: ->(pin){pin.description.present? or pin.heading.present?}

	has_attached_file :image, styles: { crop: "325x"}, :path => "/:class/:attachment/:id_partition/:style/:filename"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :flags, dependent: :destroy
  acts_as_votable
end
