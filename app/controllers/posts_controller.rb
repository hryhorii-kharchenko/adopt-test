class PostsController < ApplicationController
    POSTS_SIZE = 6
 
    def index
      
    end

    def index
        @posts_count = Post.all.count
        if @posts_count >= POSTS_SIZE
            @max_page = (@posts_count / POSTS_SIZE.to_f).ceil - 1
        else
            @max_page = 0
        end

        @page = (params[:page] || 0).to_i
        @posts = Post.offset(POSTS_SIZE * @page).limit(POSTS_SIZE)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private def post_params
        params.require(:post).permit(:name, :species, :photo)
    end
end
