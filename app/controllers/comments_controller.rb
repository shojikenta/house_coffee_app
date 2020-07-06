class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @drink = Drink.find(params[:drink_id])
    @user = @drink.user
    @comment = @drink.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@drink.nil? && @comment.save
      flash[:success] = "コメントを追加しました！"
      if @user != current_user
        @user.notifications.create(drink_id: @drink.id, variety: 2,
                                   from_user_id: current_user.id,
                                   content: @comment.content) # コメントは通知種別2
        @user.update_attribute(:notification, true)
      end
    else
      flash[:danger] = "空のコメントは投稿できません。"
    end
      redirect_to request.referrer || root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @drink = @comment.drink
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "コメントを削除しました"
    end
    redirect_to drink_url(@drink)
  end
end
