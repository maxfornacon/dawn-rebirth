class User < ApplicationRecord
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300#", small: "100x100#", extrasmall: "50x50#", thumb: "20x20#" }, default_url: ':style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_uniqueness_of :name

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :delete_all

  has_many :guilds
	has_many :messages, dependent: :destroy
  has_many :msgs, dependent: :destroy

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :animes, dependent: :destroy

  has_many :posts
  
  acts_as_voter

  def online?
    updated_at > 10.minutes.ago
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end

end
