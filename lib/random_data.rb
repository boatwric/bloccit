#Creates random data to test app functionality. Required by db/seeds.rb, where the data is held

module RandomData #modules have no dependencies or inheritence requirements; completely independent and runs only one feature

      def self.random_paragraph #RandomData.random_paragraph -> make a sentences array, use loop to create 4 to 6 random sentences (method below) and add to end of sentence array, then join sentences
        sentences = []
        rand(4..6).times do
          sentences << random_sentence
        end

        sentences.join(" ")
      end

    # #7
      def self.random_sentence #RandomData.random_sentence -> make a strings array, use loop to create 3 to 8 random words (method below) and add to strings array, then join strings and capitalize each word
        strings = []
        rand(20..30).times do
          strings << random_word
        end

        sentence = strings.join(" ")
        sentence.capitalize << "."
      end

    # #8
      def self.random_word #RandomData.random_word -> create letter array by specifying a to z to array, shuffle letters (! permanently changes order in letter array), join the 1st through nth items to make a word (can be up to 9 characters)
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0,rand(4..8)].join
      end
    end

    #To make accessible to specs:
        ##add line to application.rb -> config.autoload_paths << File.join(config.root, "lib")
    #To run:
        ##rails db:reset
    #Examples of how to use:
        ##rails c
        ##post = Post.find(3)
        ##Post.count
        ##Comment.count
        ##post = Post.first
        ##post = Post.last
