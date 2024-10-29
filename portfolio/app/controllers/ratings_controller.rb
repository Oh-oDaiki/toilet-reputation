class RatingsController < ApplicationController
before_action :authenticate_user!

def create
    @post = Post.find(params[:post_id])
    @rating = @post.ratings.new(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to @post
    else
      redirect_to post_path(@post)
    end
end

  private

  def rating_params
    params.require(:rating).permit(:value, :post_id)  # :user_idを削除
  end
end
  
