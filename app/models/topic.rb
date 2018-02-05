class Topic < ApplicationRecord
  #Because comments already depend on posts, they will also be deleted when a topic is deleted.
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

end
