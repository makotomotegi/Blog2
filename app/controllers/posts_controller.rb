class PostsController < ApplicationController
  # GET /posts/new
  def new
    @post = Post.new
  end
  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
    redirect_to @post
    else
    render :new, status: :unprocessable_entity
    end

  end
  # GET /posts/:id
    def show
      @post = Post.find(params[:id])
  end

  # GET /posts
    def index
      @posts = Post.all
  end

  private
    def post_params
    params.require(:post).permit(:title, :text)
  end
end

