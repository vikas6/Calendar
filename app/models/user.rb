class User < ActiveRecord::Base
	has_many :events
	has_many :invitations
	validates :first_name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, messages: "Only allows letters"}
	validates :last_name, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, messages: "Only allows letters"}
	validates :email, presence: true, uniqueness: {message: "already subscribed"}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create, messages: "please enter valid email"}
	validates :phone_no, presence: true, length: { minimum: 10, maximum: 15 }
	validates :date_of_birth, timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates_presence_of :username
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }

  before_save :encrypt_password
  validates_presence_of :password_hash, :on => :create
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password_hash.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
    end
  end
end
