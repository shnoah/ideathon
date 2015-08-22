class TestController < ApplicationController
    
    def index
        
        @all_tags = Tag.all
        #all_tags.each do |item|
            
        #end
        
    end
    
end
