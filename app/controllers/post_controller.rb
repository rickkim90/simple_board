class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @title = params[:title]
    @content= params[:content]
    
    Post.create(
      title: @title,
      content: @content,
      user_id: session[:user_id]
    )
    redirect_to '/'
  end

  def show
    @id = params[:id]
    @post = Post.find(@id) #post박스안에 @id를 검색해서 저장
    @comments = @post.comments #<--> Comment.all 위에 post에 담긴 글에 comment만 가지고온다
  end
  
  def modify
    @id = params[:id]
    @post = Post.find(@id)
  end
  
  def update
    # 1번 글에 대하여 수정을 할거야
    # 1번 글을 찾는다
    # 해당 글을 업데이트 한다
    @id = params[:id]
    @post = Post.find(@id)
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    
    redirect_to "/post/show/#{@id}"
  end
  
  def destroy
    @id = params[:id]
    @post = Post.find(@id)
    @post.destroy
    
    redirect_to '/'
  end
  
  def create_comment
    @comment = params[:comment]
    Comment.create(
      content: @comment,
      post_id: params[:post_id]
    )
    redirect_to :back #댓글 후 바로 뒤 페이지로
  end
end
