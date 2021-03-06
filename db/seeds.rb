#Database to hold random data used to test app. Random data generated by lib/random_data.db
#(line 22) http://ruby-doc.org/core-2.1.1/Array.html#method-i-sample 

require 'random_data' #connects to random_data.rb

 # Create Topics
 15.times do
    Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
    )
  end
  topics = Topic.all
 
  # Create Posts
50.times do
    Post.create!( #create!(bang) instructs method to throw an error if there's something wrong with the seeded data
        topic:  topics.sample,
        title:  RandomData.random_sentence, #RandomData doesn't exist yet, "wishful coding"
        body:   RandomData.random_paragraph
    )
end
posts = Post.all
 
# Create Comments
100.times do
    Comment.create!(
        post: posts.sample, #we call sample on the array returned by Post.all, picks a random post to associate each comment with, sample returns a random element from the array every time it's called
        body: RandomData.random_paragraph
    )
end
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

#To run:
    ##rails db:seed
#To reset:
    ##rails db:reset