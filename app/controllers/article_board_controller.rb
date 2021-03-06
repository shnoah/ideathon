class ArticleBoardController < ApplicationController
  
   before_action :authenticate_user!, only: [:write, :write_process]  

   
    def json_test ## 회원 DB json 파일 test
    
       @data_hash = Hash.new
        path=Rails.root.to_s
        file = File.read(path+'/public/userdb1.json')
    
        @data_hash = JSON.parse(file)
        
    end
   
    def main_board
        @tags = Tag.all
        @articles = Article.all
        
        if user_signed_in?
            @selected_articles = current_user.articles.where(statuses: {selected: true})
        end
        
        @tag_id = params[:tag_id].to_i
        
        unless @tag_id == 0
            @tagged_articles = @tags.find(@tag_id).articles
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
        
        if current_user.statuses.where(article_id: id).take.liked == true # 8/18 4:54
            stat = current_user.statuses.where(article_id: id).take
            stat.liked = false
            stat.save
            canceled_article.like -= 1
            canceled_article.save
        end # 8/18 4:54
        
        redirect_to "/article_board/detailpage/#{id}"
    end
    
    def select_delete
        id = params[:id].to_i
        stat = current_user.statuses.where(article_id: id).take
        stat.selected = false
        stat.save
        
        redirect_to "/article_board/detailpage/#{id}"
    end
    
    def tag_search
        
        tag = Tag.find_by_tagging(params[:tag_name])
        
        if tag.nil?
            redirect_to "/article_board/main_board?not_found=true"
        else
            redirect_to "/article_board/main_board?tag_id=#{tag.id}"
        end
        
    end
    
    # 8/14 12:11
    def hall_of_fame_check
        
        @articles = Article.all
        
        @hash = Hash.new
        
        @articles.each do |item|
            @hash[item.title] = item.like
        end
        
        @hash = @hash.sort_by { |title, like| like}
        @hash.reverse!
        
    end
    #여기까지
    
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
        
            
            tags = params[:tag].split(/[#,\s]/)
            tags.delete("")
            
            new_post = Article.new
    
            new_post.title =params[:title]
            new_post.summary = params[:summary]
            new_post.contents = params[:contents]
            new_post.demo_link = params[:demo_link]
            new_post.my_image = params[:image_file]
            new_post.leader_name = params[:leader_name]
            new_post.contact_kakao = params[:contact_kakao]
            new_post.contact_email = params[:contact_email]
            new_post.password = params[:password]
            new_post.save
            
            members = params[:member_name].gsub(/\s+/, "").split(",")
            
            members.each do |item|
                member = Member.new
                member.article_id = new_post.id
                member.name = item
                member.save
                #member = Member.create(:name => item, :article_id => new_post.id)
            end
    
            #태그 넣는 작업
            tags.each do |tag_name|
                new_tag = Tag.find_by_tagging(tag_name)||Tag.create(:tagging => tag_name, :created_at => new_post.id)
                new_post.tags << new_tag
            end
            
            tmp = User.find(current_user.id)
            
            tmp.posting_check =1             #한 ID 당 글은 1개만
            tmp.my_article_id = new_post.id      #자신이 쓴 글번호 저장
            
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
        
        
        @this_post.members.each do |item|
            item.destroy
        end
    #8/12 추가
        @this_post.tags.each do |item|
            item.destroy
        end
    #여기까지
        
        members = params[:member_name].gsub(/\s+/, "").split(",")
            
        members.each do |item|
            member = Member.new
            member.article_id = @this_post.id
            member.name = item
            member.save
            #member = Member.create(:name => item, :article_id => new_post.id)
        end
     
     #8/12 추가   
        tags = params[:tag].split(/[#,\s]/)
        tags.delete("")
        tags.each do |tag_name|
            new_tag = Tag.find_by_tagging(tag_name)||Tag.create(:tagging => tag_name, :created_at => @this_post.id)
            @this_post.tags << new_tag
        end
    #여기까지    
    
    #8/12 10:46 추가   
        @all_tags = Tag.all
        @all_tags.each do |item|
            if item.articles.empty?
                item.destroy
            end
        end
    #여기까지
  
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
    
    def update_reply1
        @this_post = Reply.find(params[:id]) #수정할 데이터를 뽑는다.
        @this_post.contents = params[:new_reply] #새로운 데이터를 쓴다
        
        @this_page = @this_post.article_id
        
        @this_post.save # 저장 
  
        redirect_to action: "hall_of_fame", id: @this_page
    end

#리플삭제  
    def delete_reply    
        @this_post = Reply.find(params[:id])
        
        one_reply = Reply.find(@this_post.id)
        one_reply.destroy
        
        @this_page =    @this_post.article_id
        
        redirect_to action: "detailpage", id: @this_page      
    end

#리플수정    
    def modify_reply
        @this_post = Reply.find(params[:id])      
    end
    
    def modify_reply1
        @this_post = Reply.find(params[:id])      
    end

#글 삭제시 비밀번호 체크    
    def pw_chk_process_d
        @this_post = Article.find(params[:id])
    end
    
#글 수정시 비밀번호 체크    
    def pw_chk_process_m 
        @this_post = Article.find(params[:id])
    end

#글 수정    
    def article_modify    
        
        @flag=0
        @this_post = Article.find(params[:id]) 
        @members = Array.new
        @tags = Array.new #8/12 추가
        
        
        @this_post.members.each do |item|
            @members << item.name
        end
        
    # 8/12 추가    
        @this_post.tags.each do |item|
            @tags << item.tagging
        end
    # 여기까지     
        
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
            
            #8/12 10:46 추가   
                @all_tags = Tag.all
                @all_tags.each do |item|
                    if item.articles.empty?
                        item.destroy
                    end
                end
            #여기까지
            
            redirect_to '/'       
        else
            @flag = 0      
        end          
    end
    
    
    ##
    def hall_of_fame
        today_best = Best.all.last
        if today_best.nil?
            redirect_to '/article_board/main_board'
            
        else
        @real_best = Article.find(today_best.todaybest_id)
        @real_best_like = today_best.like
        end
    end

    def hall_of_fame_action
        
        #8/14 12:11
        if user_signed_in? && (current_user.email == "cokr3430@gmail.com" || current_user.email == "ohs2033@korea.ac.kr")
            statuses = Status.all
            
            statuses.each do |item|
                item.liked = false
                item.save
            end
            
            articles = Article.all
            candidates = Hash.new
            articles.each do |item|
                candidates[item] = item.like
                item.like = 0
                item.save
            end
            
            sorted_candidates = candidates.sort_by { |key, value| value }
            
            @real_best = sorted_candidates[-1][0]
            
            while @real_best.fame == true
                sorted_candidates.pop
                @real_best = sorted_candidates[-1][0]
            end
            
            today_best = Best.new
            today_best.todaybest_id = @real_best.id
            today_best.like = sorted_candidates[-1][1]
            today_best.save
            
            @real_best.fame = true
            @real_best.save
            @real_best_like = sorted_candidates[-1][1]
        end
        #여기까지
        
    end
    
    def freeboard
        @fr=Freearticle.all
    end
    
    
    def freeboard_detail
        
        @this_article = Freearticle.find(params[:id])
        
    end
    
    
    def freeboard_modify
        
        @this_article = Freearticle.find(params[:id])
        
    end
    
    
    def freeboard_modify_action
        
        fm= Freearticle.where(:id => params[:m_id]).take
        fm.free_title = params[:m_title]
        fm.free_article= params[:m_contents]
        fm.save
        k =fm.id
        redirect_to '/article_board/freeboard/'
    end
    
    
    def freeboard_write
        
    end
    
    
    def freeboard_write_action
     fa =Freearticle.new
     fa.free_article = params[:f_contents]
     fa.free_title=params[:f_title]
     fa.free_password=params[:f_password]
     fa.free_writer=current_user.name
     fa.save
     
     redirect_to '/article_board/freeboard'
    end
    
    def freeboard_delete
        
        @this_post= Freearticle.find(params[:id])
        
        
    end
    
    def freeboard_delete_process     

        
        @flag=0
        @this_post = Freearticle.find(params[:id]) 
        
        match = params[:delete_password]
        
        if (@this_post.free_password==match)
            @flag=1
            @this_post.destroy
            
            redirect_to '/article_board/freeboard'       
        else
            @flag = 0      
        end          

    end
    
    def re_reply_write
        
        new_reply = ReReply.new
        new_reply.reply_id = params[:reply_id]
        
        new_reply.writer = current_user.name
        new_reply.writer_email = current_user.email
        new_reply.contents = params[:contents]
        new_reply.save
        
        redirect_to :back
        
    end
    
    def re_reply_delete
        
        deleted_re_reply = ReReply.find(params[:id].to_i)
        deleted_re_reply.destroy
        
        redirect_to :back
        
    end
    
    def freearticle_reply_action
        @my_reply = FreeReply.new
        @my_reply.freearticle_id = params[:article_id]
        
        @my_reply.writer = params[:username]
        @my_reply.writer_email = params[:email]
        #리플에 글쓴이 이름, 이메일 모두 받는다. 리플에 이름 출력 + 수정 삭제 시 이중 체크
        
        @my_reply.contents = params[:myreply]
        @my_reply.save
        
        redirect_to :back    
    end
       def modify_freereply
        @this_post = FreeReply.find(params[:id])      
     end
        def delete_freereply    
        @this_post = FreeReply.find(params[:id])
        
        one_reply = FreeReply.find(@this_post.id)
        one_reply.destroy
        
        @this_page =@this_post.freearticle_id
        
        redirect_to :back
    end
       def update_freereply
        @this_post = FreeReply.find(params[:id]) #수정할 데이터를 뽑는다.
        @this_post.contents = params[:new_reply] #새로운 데이터를 쓴다
        
        @this_page = @this_post.freearticle_id
        
        @this_post.save # 저장 
  
        redirect_to action: "freeboard_detail", id: @this_page
    end
end
################################################################################
