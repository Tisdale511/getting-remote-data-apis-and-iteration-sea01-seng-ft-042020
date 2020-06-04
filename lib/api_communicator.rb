require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  #binding.pry
  #look for the character
  char_name = response_hash["results"].find do |c| 
    c["name"] == character_name

  end


  # pick up the films of that character
  films_url = char_name["films"].map do |f|
    f
  end

  films_url 
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)

  films_title = [] 
  films.each do |f|
    fi = JSON.parse(RestClient.get(f))
    films_title << fi["title"]
  end
  films_title
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  fi_title = print_movies(films)
  fi_title.each do |t|
    puts t
  end

end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
