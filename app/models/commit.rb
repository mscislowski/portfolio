require 'active_record'

class Commit < ActiveRecord::Base
  belongs_to :revision
end