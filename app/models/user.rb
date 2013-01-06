class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, :dependent=>:destroy
  before_save {|user| user.email=email.downcase}
  before_save :create_remember_token
  validates :name, :presence=>true, :length=>{:maximum=>50}
  validates :password, :password_confirmation, :presence=>true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, :presence=>true, :format=>{:with=>VALID_EMAIL_REGEX }, 
   uniqueness: {case_sensitive: false}

   def feed
    Micropost.where("user_id=?", id)
  end
   private
   def create_remember_token
   	self.remember_token=SecureRandom.urlsafe_base64
   end
end
