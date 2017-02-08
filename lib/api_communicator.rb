require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
    empty =[]
  character_hash["results"].each do |ele|



      if ele["name"].downcase == character
        film_arr =  ele["films"]

        film_arr.each do |arr|
          api_call = RestClient.get(arr)
          jason_call = JSON.parse(api_call)
          empty << jason_call

        end

    end
  end
    # binding.pry
    #   if character_hash[]
    #
    empty
end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that filme
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)

  films_hash.each.with_index(1) do |film_detail,idx|

  film_detail.each do |k,v|

    puts "#{idx} #{v}"  if k == "title"
  end
  end

  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)

  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
