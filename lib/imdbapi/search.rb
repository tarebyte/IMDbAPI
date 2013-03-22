module Imdbapi
  class Search

    def initialize(search_query)
      @query = search_query
      @query.eql?(@query.match(/^tt\d+$/).to_s) ? IMDbapi::Movie.new(@query) : create_movie_list
    end

    private

    def create_movie_list
      movie_info_list = Base.get_by_name(@query)
      movie_info_list.each { |movie| IMDbapi::Movie.new(movie) }
    end

    def fetch(url)
      imdb_url = URI.parse(url)
      imdb_resp = Net::HTTP.get_response(imdb_url)
      JSON.parse(imdb_resp.body)
    end

    def get_by_name(query)
      query.gsub!(/\s/, '+')
      name_url = "http://imdbapi.org/?title=#{query}&type=json&plot=simple&episode=1&limit=10&yg=0&mt=none&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
      self.fetch(name_url)
    end

  end
end
