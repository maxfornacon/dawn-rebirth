class Anime < ApplicationRecord
	belongs_to :user
	validates :name, presence: true, length: {minimum: 2, maximum: 100}
end
                             