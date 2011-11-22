class Document < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :documents_user
  has_attached_file :file
end
