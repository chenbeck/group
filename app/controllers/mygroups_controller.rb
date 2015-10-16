class MygroupsController < ApplicationController
	def index
		@mygroups = Mygroup.all
	end

	def show
		@mygroup = Mygroup.find(params[:id])
		@posts = @mygroup.posts #能在討論群組頁面 顯示所擁有的post
	end

	def new
		@mygroup = Mygroup.new
	end

	def edit
		@mygroup = Mygroup.find(params[:id])
	end

	def create
		@mygroup = Mygroup.create(mygroup_params)

		if @mygroup.save
			redirect_to mygroups_path, notice: '新增討論版成功'
		else
			render :new
		end
	end

	def update
		@mygroup = Mygroup.find(params[:id])

		if @mygroup.update(mygroup_params)
			redirect_to mygroups_path, notice: "修改討論版成功"
		else 
			render :edit 
		end
	end

	def destroy
		@mygroup = Mygroup.find(params[:id])
		@mygroup.destroy
		redirect_to mygroups_path, alert: "討論版已刪除"
	end
end

private

def mygroup_params
	params.require(:mygroup).permit(:title, :description)
end
