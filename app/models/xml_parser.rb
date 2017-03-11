require 'active_support'
require 'active_support/core_ext'
require_relative 'project'
require_relative 'revision'
require_relative 'commit'

# Finds revisions for specific project
def find_revisions(data, project)
  revisions = []
  data['entry'].each do |a|
    index = a['name'].index('/')
    if index == nil
      index = -1
    else
      index = index - 1
    end
    if a['name'][0..index] == project['title']
      unless item_exists(revisions, a['commit']['revision'])
        revisions.push(a['commit']['revision'])
      end
    end
  end
  revisions
end

# Checks if compare exists in items array
def item_exists(items, compare)
  items.each do |a|
    if a == compare
      return true
    end
  end
  false
end

# Connection to database
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => '../../db/development.sqlite3'
)

# Send xml to hashes
xml = File.open('/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/app/models/data/svn_list.xml')
xml_log = File.open('/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/app/models/data/svn_log.xml')
hash = Hash.from_xml(xml)
log_hash = Hash.from_xml(xml_log)

# Parse Hashes
data = hash['lists']['list']
path = data['path']
projects = []
revs = []
data['entry'].each do |a|
  # Not a project
  unless a['name'][0] == '.'
    # Name substring
    index = a['name'].index('/')
    if index == nil
      index = -1
    else
      index = index - 1
    end

    # Create Project entry
    unless item_exists(projects, a['name'][0..index])
      p = Project.create(:title => a['name'][0..index], :path => path)
      projects.push(p['title'])
      rev = find_revisions(data, p)
      rev.each do |b|
        log_hash['log']['logentry'].each do |c|
          if b == c['revision'] # Revision belongs to project
            r = p.revisions.create(:revision => b, :author => c['author'], :date => c['date'], :msg => c['msg'])
            revs.push(r['revision'])
            data['entry'].each do |d|
              if d['commit']['revision'].to_s == r['revision'].to_s
                r.commits.create(:kind => d['kind'], :name => d['name'], :date => d['commit']['date'])
              end
            end
          end
        end
      end
    end
  end
end
