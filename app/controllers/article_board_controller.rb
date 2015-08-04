class ArticleBoardController < ApplicationController
    
    def main_board        
        @tags = Tag.all
        @articles = Article.all        
    end
    
################################################################################

#노승호, 이종진 작업 부분 - 노타치

################################################################################

    def tmp_mainpage
         @posts = Article.all 
    end
    
#상세페이지 
    def tmp_detailpage           
        @this_post = Article.find(params[:id])  
    end
    
    def tmp_write    
    end
    
    def tmp_write_process
        post = Article.new

        post.title =params[:title]
        post.summary = params[:summary]
        post.contents = params[:contents]
        post.demo_link = params[:demo_link]
        post.my_image = params[:image_file]
        post.leader_name = params[:leader_name]
        post.contact_kakao = params[:contact_kakao]
        post.contact_email = params[:contact_email]
        
        post.save          
        redirect_to '/'
    end
    
#수정 페이지로    
    def tmp_modify
        @this_post = Article.find(params[:id])  
    end


#본문 수정    
    def tmp_update      
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
  
        redirect_to action: "tmp_detailpage", id: @this_post.id
    end
        
    def tmp_delete
       @this_post = Article.find(params[:id])  
    end

#리플 작성    
    def tmp_write_reply
        @my_reply = Reply.new
        @my_reply.article_id = params[:article_id]
        @my_reply.contents = params[:myreply]
        @my_reply.save
        
        redirect_to :back       
    end
    
#리플 수정
    def tmp_update_reply
        @this_post = Reply.find(params[:id]) #수정할 데이터를 뽑는다.
        @this_post.contents = params[:new_reply] #새로운 데이터를 쓴다
        
        @this_page = @this_post.article_id
        
        @this_post.save # 저장 
  
        redirect_to action: "tmp_detailpage", id: @this_page
    end

#리플삭제  
    def tmp_delete_reply    
        @this_post = Reply.find(params[:id])
        
        one_reply = Reply.find(@this_post.id)
        one_reply.destroy
        
        @this_page = @this_post.article_id
        redirect_to action: "tmp_detailpage", id: @this_page      
    end

#리플수정    
    def tmp_modify_reply
        @this_post = Reply.find(params[:id])      
    end

#글 삭제시 사용    
    def tmp_pw_chk       
        @flag=0
        @this_post = Article.find(params[:id]) 
        
        match = params[:new_pwd]
        
        if (@this_post.post_pwd==match)
            @flag=1
           
            @this_post.destroy
            redirect_to '/'       
        else
            @flag = 0      
        end          
    end
end    

 
=begin        
        Model : DB
            C-Create : 별점 평가
            R-Read : 읽어보기 
            U-Update : 별점을 바꿨어
            D-Delete : 지웠어
        View : DB 출력
        Controller
        저번시간 C,R 오늘은 D
=end

################################################################################
