class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.integer :project_id
      t.integer :revision
      t.string :author
      t.string :date
      t.string :msg

      t.timestamps
    end
  end
end
