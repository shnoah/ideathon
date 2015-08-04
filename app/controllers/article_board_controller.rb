class ArticleBoardController < ApplicationController
  
   before_action :authenticate_user!, only: [:tmp_write, :tmp_write_process]  
    
    def main_board        
        @tags = Tag.all
        @articles = Article.all
        
        params_empty_check = params[:id]
        
        if params_empty_check == nil
        @tag_params = Tag.find(1)
    else
        @tag_params = Tag.find(params[:id])
        end
    
    end
    
    def tag
        @tags = Tag.all
        @articles = Article.all
        
        params_empty_check = params[:id]
                if params_empty_check == nil
        @tag_params = Tag.find(1)
    else
        @tag_params = Tag.find(params[:id])
        end
        redirect_to '/article_board/tag/?id=params[:id]'

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
        post.password = params[:password]

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
        @my_reply.writer = params[:email]
        @my_reply.contents = params[:username] + " : " + params[:myreply]
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
    def tmp_pw_chk_process_d
        @this_post = Article.find(params[:id])
    end
    
    def tmp_pw_chk_process_m 
        @this_post = Article.find(params[:id])
    end
    
    def tmp_article_modify     
        @flag=0
        @this_post = Article.find(params[:id]) 
        
        match = params[:modify_password]
        
        if (@this_post.password==match)
            @flag=1
   
        else
            @flag = 0      
        end          
    end
    
    
    def tmp_article_delete       
        @flag=0
        @this_post = Article.find(params[:id]) 
        
        match = params[:delete_password]
        
        if (@this_post.password==match)
            @flag=1
           
            @this_post.destroy
            
        #    redirect_to '/'       
        else
            @flag = 0      
        end          
    end
    
    def tmp_write_member
        @my_member = Member.new
        @my_member.article_id = params[:member_id]
        @my_member.name = params[:member_name]
        @my_member.save
        
        redirect_to :back   
    end
    
    def tmp_delete_member
        @this_member = Member.find(params[:id])
        
        one_member = Member.find(@this_member.id)
        one_member.destroy
        
        @this_page = @this_member.article_id
        redirect_to action: "tmp_detailpage", id: @this_page 
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
