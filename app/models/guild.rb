class Guild < ApplicationRecord
	belongs_to :owner
	belongs_to :user
	validates_uniqueness_of :name
	has_many :messages, dependent: :destroy
	has_attached_file :image, styles: { standart: "300x300#"}, default_url: "http://placehold.it/300x300"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
