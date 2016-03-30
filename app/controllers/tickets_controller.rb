class TicketsController < ApplicationController

  before_action :user_admin

  before_action :confirm_logged_in
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @users = User.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @users = User.all

  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update_attributes(ticket_params)
      redirect_to(:action => 'index')
    else
      render 'edit'
    end
  end

  def delete
    @ticket = Ticket.find(params[:id])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:ticket_no, :description, :user_id, :eta)
  end

end
