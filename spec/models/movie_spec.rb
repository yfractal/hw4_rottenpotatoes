require 'spec_helper'


describe Movie do
  describe ":find_same_director_movies " do
    it "should return all the movies with the same director" do
      @m1 = FactoryGirl.create(:movie,:title => "m1",:director => "same")
      @m2 = FactoryGirl.create(:movie,:title => "m2",:director => "same")
      movies = Movie.find_same_director_movies(@m1.id)
      movies.should == [@m1,@m2]
    end
  end
end
