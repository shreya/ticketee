class ProjectsController < ApplicationController
	
	before_filter :find_project, :only => [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			redirect_to @project, :notice => "Project has been created."
		end
	end

	def show
	end

	protected

	def find_project
		@project = Project.where(:id => params[:id]).first
	end
end
