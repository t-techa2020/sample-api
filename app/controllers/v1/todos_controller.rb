class V1::TodosController < ApplicationController
  def index
    todos = Todo.all
    todos_count = todos.size

    options = {
      fields: { todo: %i(user_id title completed)},
    }

    todos = todos.map do |todo|
      jsonapi_deserialize(TodoSerializer.new(todo, options).serializable_hash)
    end

    render json: {todos: todos, todos_count: todos_count}
  end
end