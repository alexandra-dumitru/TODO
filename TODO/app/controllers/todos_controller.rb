class TodosController < ApplicationController

  respond_to :html, :xml, :js

  def index
    respond_with(@list = Todo.all)
  end

  def new
    @list = Todo.new
  end  

  def create
    @list = Todo.new(params[:todo])
    if @list.save
      redirect_to todo_url(@list)
    else
      redirect_to new_todo_url
    end
  end

  def show
    @list = Todo.find(params[:id])
  end

  def edit
    @list = Todo.find(params[:id])
  end

  def destroy
    @list = Todo.find(params[:id])
    if @list.destroy
      redirect_to todos_url
    else
      redirect_to todos_url
    end
  end
  
  def update
    @list = Todo.find(params[:id])
    if @list.update_attributes(params[:todo])
      redirect_to todo_path(@list)
    else 
      redirect_to edit_todo_path(@list)
    end
  end
end
