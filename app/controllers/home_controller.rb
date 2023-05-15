class HomeController < ApplicationController
  def process_input
    title = params[:title]
    description = params[:desc]

    # CREATE YOUR TODO MODELS HERE
    todo = Todo.new

    # ASSING VALUES TO TITLE AND DESCRIPTION
    todo.title = title
    todo.description = description

    puts title
    puts description

    # SAVE THE TODO INSTANCE TO DB


    if todo.save
      flash[:notice] = 'Todo was successfully saved'
      puts "todo saved successfully"
      redirect_to root_path


    else
      # handle error
      flash[:error] = 'Failed to create todo'
      puts "failed"
      redirect_to root_path
      puts todo.errors.full_messages
    end
  end

  # GET ALL TODOS
  def index
    @todos = Todo.all
  end

  # DELETE A TODOS
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy

    flash[:notice] = 'Todo was successfully deleted'
    redirect_to root_path
  end

# UPDATE TODO

def update
  todo = Todo.find(params[:id])
  if todo.update(todo_params)
    flash[:notice] = 'Todo was successfully updated.'
  else
    flash[:error] = 'Failed to update todo.'
  end
  redirect_to root_path
end

private

def todo_params
  params.require(:todo).permit(:title, :description)
end



end
