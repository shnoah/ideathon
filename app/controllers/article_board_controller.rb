class ArticleBoardController < ApplicationController
  
   before_action :authenticate_user!, only: [:write, :write_process]  
    
    def main_board        
        @tags = Tag.all
        @articles = Article.all
        
        if user_signed_in?
            @selected_articles = current_user.articles.where(statuses: {selected: true})
        end
        
        if params[:id].blank?
        else
        @tag_params = Tag.find(params[:id])
        end
    
    end
    
    def like_process
        id = params[:id].to_i
        liked_article = Article.find(id)
        unless current_user.articles.where(statuses: {liked: true}).include? liked_article
            if current_user.statuses.where(article_id: id).empty?
                Status.create(user: current_user, article: liked_article, liked: true, selected: true)
            else
                stat = current_user.statuses.where(article_id: id).take
                stat.liked = true
                stat.selected = true
                stat.save
            end
            liked_article.like += 1
            liked_article.save
        end
        
        redirect_to "/article_board/detailpage/#{id}"
    end
    
    def like_delete
        id = params[:id].to_i
        canceled_article = Article.find(id)
        stat = current_user.statuses.where(article_id: id).take
        stat.liked = false
        stat.save
        canceled_article.like -= 1
        canceled_article.save
        
        redirect_to "/article_board/detailpage/#{id}"
    end
    
    def select_delete
        id = params[:id].to_i
        stat = current_user.statuses.where(article_id: id).take
        stat.selected = false
        stat.save
        
        redirect_to "/article_board/detailpage/#{id}"
    end
    
################################################################################

#노승호, 이종진 작업 부분 - 노타치

################################################################################

    def mainpage
         @posts = Article.all 
    end
    
#상세페이지 
    def detailpage           
        @this_post = Article.find(params[:id])  
    end
    
    def write    
       
            
    end
    
    def write_process
        
            
            
            
            post = Article.new
    
            post.title =params[:title]
            post.summary = params[:summary]
            post.contents = params[:contents]
            post.demo_link = params[:demo_link]
            post.my_image = params[:image_file]
            post.leader_name = params[:leader_name]
            post.contact_kakao = params[:contact_kakao]
            post.contact_email = params[:contact_email]
            post.password = params[:password]
            post.member_name = params[:member_name]
    
            post.save    
            
            tmp = User.find(current_user.id)
            
            tmp.posting_check =1             #한 ID 당 글은 1개만
            tmp.my_article_id = post.id      #자신이 쓴 글번호 저장
            
            tmp.save
            
            redirect_to '/article_board/main_board'
    
      
    end
    
#수정 페이지로    
    def modify
        @this_post = Article.find(params[:id])  
    end


#본문 수정    
    def update      
        @this_post = Article.find(params[:id]) #수정할 데이터를 뽑는다.
        
        @this_post.title =params[:title]
        @this_post.summary = params[:summary]
        @this_post.demo_link = params[:demo_link]
        @this_post.contents = params[:contents]
        @this_post.my_image = params[:image_file]
        @this_post.leader_name = params[:leader_name]
        @this_post.contact_kakao = params[:contact_kakao]
        @this_post.contact_email = params[:contact_email]
    
        @this_post.save # 저장 
  
        redirect_to action: "detailpage", id: @this_post.id
    end
        
    def delete
       @this_post = Article.find(params[:id])  
    end

#리플 작성    
    def write_reply
        @my_reply = Reply.new
        @my_reply.article_id = params[:article_id]
        
        @my_reply.writer = params[:username]
        @my_reply.writer_email = params[:email]
        #리플에 글쓴이 이름, 이메일 모두 받는다. 리플에 이름 출력 + 수정 삭제 시 이중 체크
        
        @my_reply.contents = params[:myreply]
        @my_reply.save
        
        redirect_to :back       
    end
    
#리플 수정
    def update_reply
        @this_post = Reply.find(params[:id]) #수정할 데이터를 뽑는다.
        @this_post.contents = params[:new_reply] #새로운 데이터를 쓴다
        
        @this_page = @this_post.article_id
        
        @this_post.save # 저장 
  
        redirect_to action: "detailpage", id: @this_page
    end

#리플삭제  
    def delete_reply    
        @this_post = Reply.find(params[:id])
        
        one_reply = Reply.find(@this_post.id)
        one_reply.destroy
        
        @this_page = @this_post.article_id
        
        redirect_to action: "detailpage", id: @this_page      
    end

#리플수정    
    def modify_reply
        @this_post = Reply.find(params[:id])      
    end

#글 삭제시 사용    
    def pw_chk_process_d
        @this_post = Article.find(params[:id])
    end
    
    def pw_chk_process_m 
        @this_post = Article.find(params[:id])
    end
    
    def article_modify     
        @flag=0
        @this_post = Article.find(params[:id]) 
        
        match = params[:modify_password]
        
        if (@this_post.password==match)
            @flag=1
   
        else
            @flag = 0      
        end          
    end
    
    
    def article_delete       

        
        @flag=0
        @this_post = Article.find(params[:id]) 
        
        match = params[:delete_password]
        
        if (@this_post.password==match)
            @flag=1
            
            
            tmp = User.find(current_user.id)
            tmp.posting_check = 0
            tmp.my_article_id = nil
            tmp.save
            
            @this_post.destroy
            
        #   redirect_to '/'       
        else
            @flag = 0      
        end          
    end
    
    
    ##
    def hall_of_fame
        @best_id     = ""
        @best_num    =0
        
        @best_id1 =""
        @best_num1 =0
        
        @articles = Article.all.where(:fame => false)
        
        
        ## 해시 사용 버젼
        #candidates = Hash.new
        #@articles.each do |item|
        #    candidates[item] = item.like
        #end
        
        #sorted_candidates = candidates.sort_by { |key, value| value }
        
        #@real_best = sorted_candidates[-1][0]
    end
    
    
end
################################################################################
