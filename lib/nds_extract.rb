$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(directors_database)
  result = {}
  director_index = 0
  while director_index < directors_database.size do
    director = directors_database[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(directors_database)
  array_of_directors = []
  index = 0
  
  while index < directors_database.length do
    array_of_directors << directors_database[index][:name]
    index += 1
  end
  array_of_directors
end

def total_gross(directors_database)
  grand_total = 0
  index = 0

  while index < directors_database.length do
    grand_total += directors_totals(directors_database)[list_of_directors(directors_database)[index]]
    index += 1
  end 
  
  grand_total
  
  
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


