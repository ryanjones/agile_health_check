class CreateScoreCards < ActiveRecord::Migration[5.1]
  def chang
    create_table :score_cards, id: :uuid do |t|
      t.references :agile_team_id, foreign_key: true

      t.timestamps
    end
  end
end
