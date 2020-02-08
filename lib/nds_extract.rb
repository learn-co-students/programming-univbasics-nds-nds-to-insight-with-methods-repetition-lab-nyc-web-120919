$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
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

def list_of_directors(source)
  result = []
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director_index] = director[:name]
    director_index += 1
  end
  result
end

def total_gross(source)
  total = 0 
  
  dir_totals_hash = directors_totals(source)
  names_list = list_of_directors(source)
  
  director_index = 0
  while director_index < names_list.size do
    director_name = names_list[director_index]
    total += dir_totals_hash[director_name]
    director_index += 1
  end
  
  total
  
  
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


