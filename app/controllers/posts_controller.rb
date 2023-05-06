class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
 
   def create
    @post = Post.new(params.require(:post).permit(:title, :start_day, :end_day, :allday,:schedule))
    if @post.save
      binding.pry
      flash[:notice] = "スケジュール登録しました。"
      redirect_to :posts
    else
      flash[:notice] = "登録に失敗しました。"
      render :new,status: :unprocessable_entity
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
    if @post.update(params.require(:post).permit(:title, :start_day, :end_day, :allday, :schedule))
      flash[:notice] = "更新しました"
      redirect_to :posts
    else
      flash[:notice] = "編集に失敗しました。"
      render :edit,status: :unprocessable_entity
    end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "予定を削除しました"
      redirect_to :posts,status: :see_other
    end
  end
