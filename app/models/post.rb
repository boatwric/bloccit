class Post < ApplicationRecord
    belongs_to :topic #Because comments already depend on posts, they will also be deleted when a topic is deleted.
    has_many :comments, dependent: :destroy #allows a post instance to have many comments related to it,  also provides methods that allow comment retrieval; similar to way attr_accessor generates 'getter' and 'setter' methods for instance variables; destroying post also creates cascade deletion that will destroy its comments too
end
