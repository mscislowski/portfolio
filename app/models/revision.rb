require 'active_record'

class Revision < ActiveRecord::Base
  has_many :commits
  belongs_to :project
end
