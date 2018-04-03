#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
get_character_JSON_data(character)
character_movies_urls = get_character_movies_from_api(character)
parse_character_movies(character_movies_urls)
show_character_movies(character)


# ORIGINAL:
#!/usr/bin/env ruby
#
# require_relative "../lib/api_communicator.rb"
# require_relative "../lib/command_line_interface.rb"
#
# welcome
# character = get_character_from_user
# character_movie_urls = get_character_movies_from_api(character)
# all_character_movies = parse_character_movies(character_movie_urls)
# show_character_movies(character)
