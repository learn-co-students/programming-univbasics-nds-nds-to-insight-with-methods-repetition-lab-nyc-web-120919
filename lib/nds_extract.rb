$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)    #define method directors_totals, accepts source
  result = {}                   # creates empty hash named result 
  director_index = 0            # sets counter variable director_index to 0 
  while director_index < source.size do # while condition, run through all                                                   elements of source
    director = source[director_index]    # sets var director to current index  
    result[director[:name]] = gross_for_director(director) #adds name at    current index to hash result as key with value gross_for_director at current index.
    director_index += 1   #increments counter 
  end                     #end while loop 
  result                #sets value of directors_totals method to result hash 
end                      #end method 

def gross_for_director(d)       #define method gross_for_director, accepts d 
  total = 0                     #sets var total to 0
  index = 0                     #sets counter var index to 0 

  while index < d[:movies].length do  #sets while condition, loop through all                                       :movies for d   
    total += d[:movies][index][:worldwide_gross] #add value at :worldwide_gross                         for current index to total  
    index += 1                          #increments counter 
  end                                   #end while loop

  total                   #sets value of gross_for_director to var total  
end                            #end method 

def list_of_directors(source)
  director_names = []
  i = 0 
  
  while i < source.length do 
    director_names.push(source[i][:name])
    i += 1 
  end
  
  director_names 
end

def total_gross(source)
  director_gross = directors_totals(source)
  director_names = list_of_directors(source)
  total = 0 
  i = 0 
  
  while i < director_names.length do 
   total += director_gross[director_names[i]]
   i += 1 
  end
  
  total 
end


