class PostsController < ApplicationController

  before_filter :find_subject
  def index
    @posts = @subject.posts.all
    @top_posts = @subject.posts.order("created_at desc").limit(5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @post = @subject.posts.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = @subject.posts.build(params[:post])
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to subject_posts_path(@subject), notice: t('notice.update', model: Post.model_name.human) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to subject_posts_path(@subject), notice: t('notice.update', model: Post.model_name.human) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to subject_posts_path(@subject), notice: t('notice.destroy', model: Post.model_name.human) }
    end
  end

  private

  def find_subject
    @subject = Subject.find params[:subject_id]
  end
end
