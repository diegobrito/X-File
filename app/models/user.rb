class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  ROLES = %w[admin user banned]
  
  has_and_belongs_to_many :documents
  has_many :documents_users

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :first_name, :last_name, :role, :email, :password, :password_confirmation, :remember_me
end
