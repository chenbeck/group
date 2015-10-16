class PostsController < ApplicationController

=begin
	少了兩個action: index , show
	因為全部的文章 都直接在討論版的頁面出現 所以在post controller裡面不需要這兩個功能
=end 

	def new
		@mygroup = @Mygroup.find(params[:mygroup_id])
		@post = @mygroup.posts.new
	end

	def edit
		@mygroup = @Mygroup.find(params[:mygroup_id])
		@post = @mygroup.posts.find(params[:id])
	end

	def create
		@mygroup = @Mygroup.find(params[:mygroup_id])
		@post = @mygroup.posts.build(post_params)

		if @post.save
			redirect_to mygroup_path(@mygroup), notice: "新增文章成功！"
		else 
		    render :new 	
		end
	end

	def update
		@mygroup = @Mygroup.find(params[:mygroup_id]) #從所有討論群中 先找出要更新的 那個討論版
		@post = @mygroup.posts.find(params[:id]) # 要更新的文張 是某討論版裡 所有文章中的 某篇

		if @post.update(post_params)
			redirect_to mygroup_path(@mygroup), notice: "文章修改成功！"
		else
		    render :edit 	
		end
	end

	def destroy
	  @mygroup = Mygroup.find(params[:mygroup_id])
	  @post = @mygroup.posts.find(params[:id])

	  @post.destroy
	  redirect_to mygroup_path(@mygroup), alert: "文章已刪除！"
	end
end

private

def post_params
	params.require(:post).permit(:content)
end
