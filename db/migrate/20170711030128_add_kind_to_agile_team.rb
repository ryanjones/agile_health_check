class AddKindToAgileTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :agile_teams, :kind, :integer, default: 0
  end
end
