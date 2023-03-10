# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
# TODO!
# rails generate model Studio
# rails generate model Movie
# rails generate model Actor
# rails generate model Role
# Enter info to in migrate files to create columns THEN migrate
# rails db:migrate

puts "There are #{Studio.all.count} studios in the studio table."
puts "There are #{Movie.all.count} movies in the movies table."
puts "There are #{Actor.all.count} actors in the actors table."
puts "There are #{Role.all.count} roles in the movies table."

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# Insert data for studio
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

puts "There are #{Studio.all.count} studios in the studio table."

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = 1
new_movie.save

new_movie1 = Movie.new
new_movie1["title"] = "The Dark Knight"
new_movie1["year_released"] = 2008
new_movie1["rated"] = "PG-13"
new_movie1["studio_id"] = 1
new_movie1.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight Rises"
new_movie2["year_released"] = 2012
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = 1
new_movie2.save

puts "There are #{Movie.all.count} movies in the movie table."

actor1 = Actor.new
actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"] = "Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["name"] = "Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["name"] = "Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["name"] = "Heath Ledger"
actor8.save

actor9 = Actor.new
actor9["name"] = "Maggie Gyllenhaal"
actor9.save

actor10 = Actor.new
actor10["name"] = "Tom Hardy"
actor10.save

actor11 = Actor.new
actor11["name"] = "Joseph Gordon-Levitt"
actor11.save

actor12 = Actor.new
actor12["name"] = "Anne Hathaway"
actor12.save

puts "There are #{Actor.all.count} actors in the actor table."

role1 = Role.new
role1["movie_id"] = 1
role1["actor_id"] = 1
role1["character_name"] = "Bruce Wayne"
role1.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all
studios = Studio.all

for movie in movies
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]
    studio_id = Studio.find_by({"id" => movie["studio_id"]})
    #studio_name = studio_id["name"]
    puts "#{title} #{year_released} #{rated} #{studio_id}" # need to add studio name
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
roles = Role.all
actors = Actor.all
for role in roles
    movie_id = Movie.find_by({"id" => role["movie_id"]})
    actor_id = Actor.find_by({"id" => role["actor_id"]})
    movie_title = movie_id["title"]
    actor_name = actor_id["name"]
    actor_role = role["name"]
    puts "#{movie_title} #{actor_name} #{actor_role}" 
end

