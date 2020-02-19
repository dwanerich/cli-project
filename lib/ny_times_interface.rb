class NYTInterface

    def self.fetch_stories_for_category(category)
        
        response = HTTParty.get("https://api.nytimes.com/svc/topstories/v2/#{category}.json?api-key=rVFIgSZh3fGk0wXTzOl48y89ozhV54uh").body #abracted away category allowing this code to be used more flexible.
        if response.include?("Section not found")
          return nil
        else
          JSON.parse(response)["results"].first(3) #assigned the first three news selections for any given category to a variable  
        end
      end
end