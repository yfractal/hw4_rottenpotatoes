class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end


  def self.find_same_director_movies(id)
    movie = Movie.find(id)
    director = movie.director
    if director == nil or director == ""
      return []
    end
    return Movie.find_all_by_director(director)
  end

  # def self.find_same_director_movies(id)
    # r = []
    # movie = Movie.find(id)
    # case movie
# 
    # when nil
    # else
      # case director = movie.director
      # when nil
      # when ''
      # else r = Movie.find_all_by_directory(director)
      # end
    # end
    # return r
# 
  # end

end

