class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  validates :title, presence: true
  default_scope {order :due_date}
end
