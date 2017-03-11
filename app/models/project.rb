require 'active_record'

class Project < ActiveRecord::Base
  has_many :revisions
end
