class NYTInterface

    def self.fetch_stories_for_category(category)
        
        response = HTTParty.get("https://api.nytimes.com/svc/topstories/v2/#{category}.json?api-key=rVFIgSZh3fGk0wXTzOl48y89ozhV54uh").body #abracted away category allowing this code to be used more flexible.
        
        results = JSON.parse(response)["results"].first(3) #assigned the first three news selections for any given category to a variable

        results.map do |result|
          Story.new(result["title"], result["byline"], result["abstract"]) #here we interate thru the results using map creating a new hash including our 3 specific attributes. 
        end
    end
end