class Claim < ApplicationRecord
  belongs_to :user
  
  has_many :photos

  validates_presence_of :user_id
  validates_acceptance_of :terms_and_conditions

  accepts_nested_attributes_for :photos
end
