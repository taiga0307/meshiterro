class PostImagesController < ApplicationController
    def new
    	@post_image = PostImage.new #画像投稿の画面を表示の空箱作成
    end
    def create # 投稿データの保存
    	@post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        if @post_image.save
          redirect_to post_images_path
        else
          render :new
        end
    end
    def index
    	@post_images = PostImage.page(params[:page]).reverse_order
    end
    def show
    	@post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new # コメントのインスタンス変数を記述
    end

    private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
