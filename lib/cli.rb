class CLI



    def welcome
        puts " "
        puts " "
        puts "---------------------------"
        puts "Welcome to 1st 3 - The App!"
        puts "---------------------------"

        puts " "
        puts "Enter a category from below for top stories?"
        puts " "
        puts "arts / automobiles / books / business / fashion / food / health"
        puts "movies / politics / realestate / science / sports / technology / travel"
        puts " "
    end

    def get_stories
      category = gets.chomp
        results = NYTInterface.fetch_stories_for_category(category)

        if results == nil
          invalid_input
          run
        else
          results.each do |result|
          Story.new(result["title"], result["byline"], result["abstract"]) #here we interate thru the results using each creating a new hash including our 3 specific attributes. 
          end
        end
      end

      def display_stories
        stories = Story.all

        puts " "
        puts "------------------------"
        puts "Here are the top stories"
        puts "------------------------"
        puts " "
        stories.each_with_index do |story, index|
          puts "#{index + 1}. #{story.title}"
        end
      end

      def more_story_details
         puts " "
          puts "which one would you like to learn more about Press 1, 2 or 3?"
          puts " "
       
        
          selection = gets.chomp.to_i - 1
          story = Story.all[selection]
        
        puts "------------"
        puts "Loading info"
        puts "------------"
        puts " "
        sleep(2)
        
        print_info(story)
        other_categories
      end



    def run
        welcome
        get_stories
        display_stories
        more_story_details
        
    end


        def print_info(story)
           
            puts story.title
            puts story.abstract
            puts story.byline
        end



        def invalid_input
          puts "-------------------------------"
          puts "oops, please type a valid entry"
          puts "-------------------------------"
          
        end

        

        def other_categories
           
        
            puts " "
            puts "-------------------------------------------------------------------------"
            puts "What other category from below would you like to see the top stories for?"
            puts "--------------------------------------------------------------------------"
            puts " "
            puts "-----------------------"
            puts " or to EXIT type exit!"
            puts "-----------------------"
            puts " "
            puts "arts / automobiles / books / business / fashion / food / health"
            puts "movies / politics / realestate / science / sports / technology / travel"
            puts " "
            
            Story.clear_all
            get_stories
            display_stories
            more_story_details
        end
        
      
end
