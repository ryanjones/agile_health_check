class CreateScoreCardAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :score_card_answers, id: :uuid do |t|
      t.references :score_card, foreign_key: true, type: :uuid
      t.references :question, foreign_key: true, type: :uuid
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
