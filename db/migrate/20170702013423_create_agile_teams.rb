class CreateAgileTeams < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'

    create_table :agile_teams, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
