class ArticleBoardController < ApplicationController
    
    def main_board
        
        @tag = Tag.all
        
    end
    
    
    
    
######################################################

#노승호, 이종진 작업 부분 - 노타치

##########################################################

    def mainpage
         @posts = Post.all 
    end
    
    def write    
    end
    
    def write_process
        post = Post.new

        post.post_name= params[:a_name] 
        post.post_pwd =  params[:password]

        post.post_title =params[:title]
        post.post_short_content = params[:short_title]
        post.post_content = params[:content]
        post.my_image = params[:image_file]
        post.post_contact = params[:contact]
        post.post_tag = params[:tag]
        
        post.save          
        redirect_to '/'
    end
    
#수정 페이지로    
    def modify
        @this_post = Post.find(params[:id])  
    end


#본문 수정    
    def update      
        @this_post = Post.find(params[:id]) #수정할 데이터를 뽑는다.
        
        @this_post.post_title =params[:title]
        @this_post.post_short_content = params[:short_title]
        @this_post.post_content = params[:content]
        @this_post.post_contact = params[:contact]
        @this_post.post_tag = params[:tag]
    
        @this_post.save # 저장 
  
        redirect_to action: "detailpage", id: @this_post.id
    end
        
    def delete
       @this_post = Post.find(params[:id])  
    end
    
#리플 수정
    def update_reply

        @this_post = Reply.find(params[:id]) #수정할 데이터를 뽑는다.
        @this_post.content = params[:new_reply] #새로운 데이터를 쓴다
        
        @this_page = @this_post.post_id
        
        @this_post.save # 저장 
  
        redirect_to action: "detailpage", id: @this_page
    end
    
        
    
    def write_reply
        @my_reply = Reply.new
        @my_reply.post_id = params[:post_id]
        @my_reply.content = params[:myreply]
        @my_reply.save
        
        redirect_to :back       
    end
 
    def detailpage   
        
        @this_post = Post.find(params[:id]) 
     #   @this_reply = Reply.find(params[:post_id])
        
    end
  
    def delete_reply    
        
        @this_post = Reply.find(params[:id])
        
        one_reply = Reply.find(@this_post.id)
        one_reply.destroy
        
        @this_page = @this_post.post_id
        redirect_to action: "detailpage", id: @this_page
        
    end
    
    def modify_reply
        
        @this_post = Reply.find(params[:id])    
    
    end


#글 삭제시 사용    
     def pw_chk       
        @flag=0
        @this_post = Post.find(params[:id])  
        match = params[:new_pwd]
        
        if (@this_post.post_pwd==match)
            @flag=1
           
            @this_post.destroy
            redirect_to '/'       
        else
            @flag = 0      
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

#####################################################################



end
