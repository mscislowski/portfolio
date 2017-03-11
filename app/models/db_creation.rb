require 'active_record'
require 'active_support'
require 'active_support/core_ext'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => '../../db/developement.sqlite3'
)

ActiveRecord::Schema.define do
  create_table :projects do |table|
    table.column :title, :string
    table.column :path, :string
  end

  create_table :revisions do |table|
    table.column :project_id, :integer
    table.column :revision, :integer
    table.column :author, :string
    table.column :date, :string
    table.column :msg, :string
  end

  create_table :commits do |table|
    table.column :revision_id, :integer
    table.column :kind, :string
    table.column :name, :string
    table.column :date, :string
  end
end