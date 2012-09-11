class RepliesController < ApplicationController
  before_filter :find_post
  def index
    @replies = @post.replies.page(params[:page])
    @top_posts = Post.order("created_at desc").limit(5)
    @reply = Reply.new

    respond_to do |format|
      format.html  
      format.json { render json: @replies }
    end
  end

  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @reply }
    end
  end

  def new
    @reply = Reply.new

    respond_to do |format|
      format.html 
      format.json { render json: @reply }
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def create
    @reply = @post.replies.new params[:reply]
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        format.html { redirect_to post_replies_path(@post), notice: t('notice.create', model: Reply.model_name.human) }
      else
        format.html { redirect_to post_replies_path(@post), notice: t('notice.failed', model: Reply.model_name.human) }
      end
    end
  end

  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to post_replies_path(@post), notice: t('notice.update', model: Reply.model_name.human) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to post_replies_path(@post), notice: t('notice.destroy', model: Reply.model_name.human) }
    end
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end
end
