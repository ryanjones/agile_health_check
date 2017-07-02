class CreateScoreCards < ActiveRecord::Migration[5.1]
  def change
    create_table :score_cards, id: :uuid do |t|
      t.references :agile_team, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
