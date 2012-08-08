class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates :name, :presence=>true, :length=>{:maximum=>50}
  validates :password, :password_confirmation, :presence=>true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, :presence=>true, :format=>{:with=>VALID_EMAIL_REGEX }
end
