class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :text
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
