class ProjectsController < ApplicationController
	
	before_filter :find_project, :only => [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			redirect_to @project, :notice => "Project has been created."
		else
			flash[:alert] = "Project has not been created."
			render :action => 'new'	
		end
	end

	def show
	end

	protected

	def find_project
		@project = Project.where(:id => params[:id]).first
	end
end
