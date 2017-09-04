class User < ApplicationRecord
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300#", small: "100x100#", extrasmall: "50x50#", thumb: "20x20#" }, default_url: ':style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

  validates_uniqueness_of :name

  has_many :pins, dependent: :destroy

  has_many :guilds
	has_many :messages, dependent: :destroy
  has_many :msgs, dependent: :destroy

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :animes, dependent: :destroy

  has_many :posts

  has_many :updates
  
  acts_as_voter
  
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  has_many :personal_messages, dependent: :destroy


  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end

end
