class VoteBoardController < ApplicationController
    
    before_action :authenticate_user!, only: [:entry, :already_vote, :poll]  
    
    def entry
        
        @finalentry = params[:votes].split(",")
        
        if current_user.final_entries.empty?
              @finalentry.each do |x|
        
                
              FinalEntry.create(:user_id => current_user.id, :final_id =>x.to_i)
           
              end
        else
            redirect_to '/vote_board/already_vote'
            
        end
            
         
        
           
    end
    
    
    
    
    def already_vote
        
        @final=current_user.final_entries
        @finalall=FinalEntry.all
        
    end
    
    def poll
        
        #개표
        @article_hash = Hash.new(0)
        
        FinalEntry.all.each do |item|
            @article_hash[Article.find(item.final_id)] += 1
        end
        
        @article_hash = @article_hash.sort_by { |id,score| score }
        @article_hash.reverse!
        
        #토토 집계
        @user_hash = Hash.new(0)
        
        #최종 투표 결과 상위 n팀을 몇명으로 할지는 아래에있는 @rank_limit 변수를 고치면 됨돠
        @rank_limit = 2
        #
        
        win_articles_id = Array.new
        @article_hash.first(@rank_limit).each do |item|
            win_articles_id << item[0].id
        end
        
        User.all.each do |u|
            toto_score = 0
            u.final_entries.each do |item|
                if win_articles_id.include? item.final_id
                    toto_score += 1
                end
            end
            @user_hash[u] = toto_score
        end
        
        @user_hash = @user_hash.sort_by { |user,score| score }
        @user_hash.reverse!
        
    end
end
