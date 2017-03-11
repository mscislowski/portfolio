require 'sqlite3'

begin
  db = SQLite3::Database.open '/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/db/development.sqlite3'
  db.results_as_hash = true

  ary = db.execute 'SELECT * FROM Projects'
  ary.each do |row|
    puts "#{row['title']} at path: #{row['path']}"
  end

  ary = db.execute 'SELECT * FROM Revisions'
  ary.each do |b|
    puts "Project id: #{b['project_id']}, revision: #{b['revision']}, author #{b['author']}, date #{b['date']}, msg #{b['msg']}"
  end

  ary = db.execute 'SELECT * FROM Commits'
  ary.each do |b|
    puts "Revision id: #{b['revision_id']}, Kind: #{b['kind']}, name: #{b['name']}, date: #{b['date']}"
  end

rescue SQLite3::Exception => e
    puts 'Exception occurred'
    puts e
ensure
  db.close if db
end