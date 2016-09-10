class Message < ApplicationRecord
  belongs_to :user
  belongs_to :guild
	validates :body, presence: true, length: {minimum: 2, maximum: 1000}
	def timestamp
	  created_at.strftime('%H:%M:%S %d %B %Y')
	end
	after_create_commit { MessageBroadcastJob.perform_later(self) }

	auto_html_for :body do
		html_escape
		image
		youtube(width: 300, height: 200 )
		link target: '_blank', rel: 'nofollow'
		simple_format
	end
end
