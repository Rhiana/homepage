class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        flash[:notice] = 'To Do was successfully created.'
        format.html { redirect_to action: 'index'}
      else
        flash[:error] = "Cannot create a blank to do item."
        format.html { redirect_to action: 'index' }
      end
    end
  end

  # PATCH/PUT /todos/1
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        flash[:notice] = 'To Do was successfully updated.'
        format.html { redirect_to action: 'index'}
      else
        flash[:error] = "Cannot update to a blank to do item."
        format.html { redirect_to action: 'index' }
      end
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    respond_to do |format|
      flash[:notice] = 'To Do was successfully deleted.'
      format.html { redirect_to todos_url }
    end
  end

  def index
    @todos = Todo.paginate(:page => params[:page], 
      :order => 'created_at DESC', 
      :per_page => 10)
        respond_to do |format|
        format.html
        format.json { render json: @todos }
      end 
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:user_id, :description, :completed)
    end
end
