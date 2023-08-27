class V1::TodosController < ApplicationController
  def index
    todos = Todo.all
    todos_count = todos.size

    options = {
      only: { instance: %i(id user_id title completed)},
      root_key: :todos,
      meta: { todos_count: todos_count }
    }

    render json: TodoSerializer.serialize(todos, options)
  end
end