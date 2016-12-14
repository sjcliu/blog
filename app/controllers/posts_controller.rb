class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params

        if @post.save
            redirect_to @post, notice: "Hell yeah, Stanly good job on posting another article."
        else
            render 'new', notice: "Oh no, Stanly unable to save post."
        end
    end

    def show
    end

    def edit
    end

    def update
        if @post.update post_params
            redirect_to @post, notice: "Great articles was successfully updated."
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :slug)
    end

    def find_post
        @post = Post.friendly.find(params[:id])
    end
end
