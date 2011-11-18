class DocumentsUser < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
  validates :document_id, :uniqueness => { :scope => :user_id,
    :message => "is already shared with the user" }
  validates_presence_of :user_id
  validates_presence_of :document_id
  validates_numericality_of :user_id
  validates_numericality_of :document_id
end