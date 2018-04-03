
#bonus code = broke the get character method into 2 -> one to pull JSON data and one to pull titles for character 
require 'pry'
require 'json'
require 'rest-client'

def get_character_JSON_data(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash["results"].each do |person|
    if person["name"].downcase == character
      return person
    end
  end
end

def get_character_movies_from_api(character)
  data = get_character_JSON_data(character)
  films_array = []
  i = 0
  until i == data["films"].length
    films_array.push(data["films"][i])
    i += 1
  end
  films_array
end

def parse_character_movies(character_movies_urls)
  final_movies_array = []
  i = 0
  until i == character_movies_urls.length
    the_movie = RestClient.get(character_movies_urls[i])
    the_movie_JSON = JSON.parse(the_movie)
    final_movies_array.push(the_movie_JSON["title"])
    i += 1
  end
  final_movies_array
end

def show_character_movies(character)
  urls = get_character_movies_from_api(character)
  the_array = parse_character_movies(urls)
  i = 0
  until i == the_array.length
    puts "#{i + 1}. #{the_array[i]}"
    i += 1
  end
end

# ORIGINAL CODE:
# require 'pry'
# require 'json'
# require 'rest-client'
#
# def get_character_movies_from_api(character)
#  films_array = []
#  all_characters = RestClient.get('http://www.swapi.co/api/people/')
#  character_hash = JSON.parse(all_characters)
#  character_hash["results"].each do |person|
#    if person["name"].downcase == character
#      i = 0
#      until i == person["films"].length
#        films_array.push(person["films"][i])
#        i += 1
#      end
#    end
#  end
#  films_array
# end
#
# def parse_character_movies(character_movies_urls)
#  final_movies_array = []
#  i = 0
#  until i == character_movies_urls.length
#    the_movie = RestClient.get(character_movies_urls[i])
#    the_movie_JSON = JSON.parse(the_movie)
#    final_movies_array.push(the_movie_JSON["title"])
#    i += 1
#  end
#  final_movies_array
# end
#
# def show_character_movies(character)
#  urls = get_character_movies_from_api(character)
#  the_array = parse_character_movies(urls)
#  i = 0
#  until i == the_array.length
#    puts "#{i + 1}. #{the_array[i]}"
#    i += 1
#  end
# end
# ## BONUS
#
# # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# # can you split it up into helper methods?
