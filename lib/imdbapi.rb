require_relative "imdbapi/version"

require 'active_support/core_ext/module/delegation'
require 'json'
require 'net/http'

require_relative 'imdbapi/movie.rb'
require_relative 'imdbapi/search.rb'
require_relative 'imdbapi/top_250.rb'

module Imdbapi
end
