
CONNECTION = SQLite3::Database.new("assignment.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, name TEXT, description TEXT, repo TEXT, link TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS collaborators (id INTEGER PRIMARY KEY, username TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS collaborations (assignment_id INTEGER, collaborator_id INTEGER);")
# CONNECTION.execute('INSERT INTO users (name) VALUES ("patrick");')

CONNECTION.results_as_hash = true

