class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.integer :revision_id
      t.string :kind
      t.string :name
      t.string :date

      t.timestamps
    end
  end
end
