#Controls the post attributes passed into db
#http://guides.rubyonrails.org/active_record_validations.html

class Post < ActiveRecord::Base #My validation tests fail if Post < ApplicationRecord???
    #Because comments already depend on posts, they will also be deleted when a topic is deleted.
    belongs_to :topic
    #allows a post instance to have many comments related to it,  also provides methods that allow comment retrieval; similar to way attr_accessor generates 'getter' and 'setter' methods for instance variables; destroying post also creates cascade deletion that will destroy its comments too
    has_many :comments, dependent: :destroy 

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
end
