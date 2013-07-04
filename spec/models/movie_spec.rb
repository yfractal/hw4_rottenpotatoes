require 'spec_helper'


describe Movie do
  describe ":find_same_director_movies " do
    it "should return null if id is invilad" do
      Movie.stub(:find).and_return(nil)
      Movie.find_same_director_movies(1).should == []
    end

    it "should return no movies if the movie without director" do
      fake_movie = mock('movie',:director => nil)
      Movie.stub(:find).and_return(fake_movie)
      Movie.find_same_director_movies(1).should == []

    end

    it "should return the movies with same director" do
      m1 = FactoryGirl.build(:movie,:title => "t1",:director => "d1")
      m2 = FactoryGirl.build(:movie,:title => "t1",:director => "same")
      m3 = FactoryGirl.build(:movie,:title => "t1",:director => "same")
      m4 = FactoryGirl.build(:movie,:title => "t1",:director => "same")
      Movie.find_same_director_movies(m2.id)

    end

  end
end
