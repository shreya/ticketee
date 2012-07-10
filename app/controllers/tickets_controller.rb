class TicketsController < ApplicationController
	before_filter :find_project
	before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]
  
  def new
  	@ticket = @project.tickets.build
  end

  def create
  	@ticket = @project.tickets.build(params[:ticket])
  	if @ticket.save
  		redirect_to [@project, @ticket], :notice => "Ticket has been created."
  	else
  		flash[:alert] = "Ticket has not been created."
  		render :action => 'new'
  	end
  end

  def index
  	@tickets = @project.tickets
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end


  def destroy
  end

  protected
  def find_project
  	@project = Project.where(:id => params[:project_id]).first
  	unless @project
  		redirect_to projects_path, :notice => "Could not find project"
  	end
  end

  def find_ticket
  	@ticket = @project.tickets.where(:id => params[:id]).first
  	unless @ticket
  		redirect_to @project, :notice => "Could not find ticket."
  	end
  end

end
