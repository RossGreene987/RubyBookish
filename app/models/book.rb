class Book < ApplicationRecord
  has_many :copies, dependent: :destroy
  
  # TODO: handle better if validation fails
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
end
