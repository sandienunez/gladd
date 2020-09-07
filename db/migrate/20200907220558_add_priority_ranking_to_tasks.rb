class AddPriorityRankingToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :priority_ranking, :integer
  end
end
