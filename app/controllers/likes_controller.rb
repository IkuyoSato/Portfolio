class LikesController < ApplicationController
  def index
    @like_topics = current_user.like_topics
  end

  def create
    like = Like.new
    like.user_id = current_user.id
    like.topic_id = params[:topic_id]

    if like.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入り登録に失敗しました'
    end
  end

  #いいねの削除
  def destroy
    like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    like.destroy
    redirect_to topics_path
  end
end
