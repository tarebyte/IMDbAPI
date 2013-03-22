module Imdbapi
  class Movie

    delegate :rating, :genres,   :rated,   :language, :title,     :runtime,                      to: :movie_json
    delegate :poster, :imdb_url, :writers, :imdb_id,  :directors, :rating_count,                 to: :movie_json
    delegate :actors, :synopsis, :year,    :country,  :type,      :release_date, :also_known_as, to: :movie_json

    attr_reader :movie_json

    def initialize(user_data)

      # If a user wants to make a movie by ID we'll get the json data for it then create it
      # if not this is json we need to parse to make the movie without anymore work
      #
      self.is_IMDb_iD(user_data) ? @movie_json = self.get_by_id(user_data) : @movie_json = make_movie(user_data)
    end

    def is_IMDb_iD(data)
      data.eql?(data.match(/^tt\d+$/).to_s)
    end

    def get_by_id(id)
      id_url = "http://imdbapi.org/?id=#{id}&type=json&plot=simple&episode=1&lang=en-US&aka=simple&release=simple&business=0&tech=0"
      self.fetch(id_url)
    end

    def fetch(url)
      imdb_url = URI.parse(url)
      imdb_resp = Net::HTTP.get_response(imdb_url)
      self.make_movie(imdb_resp)
    end

    def make_movie(response)
      JSON.parse(response.body, :object_class => OpenStruct)
    end

  end
end
