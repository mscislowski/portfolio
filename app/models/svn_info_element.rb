require 'active_record'

class Project < ActiveRecord::Base
  has_many :revisions
end

class Revision < ActiveRecord::Base
  belongs_to :project
  has_many :commits
end

class Commit < ActiveRecord::Base
  belongs_to :revision
end