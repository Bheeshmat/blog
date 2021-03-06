# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret",
  only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comments = @article.comments.find(params[:id])
    @comments.destroy
    redirect_to article_path(@article)
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
