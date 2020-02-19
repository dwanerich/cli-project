class CLI


    def run
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
        
        category = gets.chomp
        stories = NYTInterface.fetch_stories_for_category(category)
        run
      

        puts " "
        puts "------------------------"
        puts "Here are the top stories"
        puts "------------------------"
        puts " "
        stories.each_with_index do |story, index|
          puts "#{index + 1}. #{story.title}"
        end
          puts " "
          puts "which one would you like to learn more about Press 1, 2 or 3?"
          puts " "
       
        
          selection = gets.chomp.to_i - 1
          story = stories[selection]bin/
        
        puts "------------"
        puts "Loading info"
        puts "------------"
        puts " "
        sleep(2)
        
        print_info(story)
        other_categories
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
        
        category = gets.chomp
        stories = NYTInterface.fetch_stories_for_category(category)

        puts " "
        puts "-------------------------"
        puts "Here are the top stories"
        puts "-------------------------"
        puts ""
        stories.each_with_index do |story, index|
          puts "#{index + 1}. #{story.title}"
        end
        
        puts " "
        puts "which one would you like to learn more about Press 1, 2 or 3?"
       
        selection = gets.chomp.to_i - 1
        story = stories[selection]
        
        puts " "
        puts "-------------"
        puts "Loading info"
        puts "-------------"
        sleep(2)
        
        print_info(story)
        other_categories
        
    end
end
