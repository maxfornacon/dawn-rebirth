class Msg < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50)}
  auto_html_for :content do
		html_escape
		image
		youtube(width: 300, height: 200 )
		link target: '_blank', rel: 'nofollow'
		simple_format
	end
end
