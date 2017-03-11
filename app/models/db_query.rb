require 'sqlite3'

begin
  db = SQLite3::Database.open '/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/db/projects.sqlite3'
  db.results_as_hash = true

  ary = db.execute 'SELECT * FROM Projects'
  ary.each do |row|
    puts "#{row['title']} at path: #{row['path']}"
  end

rescue SQLite3::Exception => e
    puts 'Exception occurred'
    puts e
ensure
  db.close if db
end