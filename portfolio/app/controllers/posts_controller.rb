class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :destroy]
  
    def index
      @posts = Post.includes(:user, :ratings).all
    end
  
    def new
      @post = Post.new
      @post.ratings.build 
    end
  
    def create
        @post = Post.new(post_params)
        @post.user = current_user 

        @post.ratings.each { |rating| rating.user = current_user }
        
        
        if @post.save
          flash[:notice] = "投稿完了"
          redirect_to posts_path
        else
          flash.now[:danger] = "すべての項目に入力してください"
          render :new
        end
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :image, ratings_attributes: [:id, :value])
    end

    def correct_user
      @post = current_user.posts.find_by(id:params[:id])
      unless @post 
        redirect_to posts_path
      end
    end

end
