class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        
    end

    def create
        @post = Post.new(post_params)
 
        @post.save
        redirect_to root_path

        # upload = params[:post][:photo]

        # unless upload and upload.content_type =~ /^image\/(jpeg|jpg)$/
        #     # errors.add(:upload, "Not a valid image")
        # end
    end

    private def post_params
        params.require(:post).permit(:name, :species, :photo)
    end
end
