require 'spec_helper'

describe MoviesController do
	describe "find same director moves" do 
		before :each do 
			@m1 = FactoryGirl.create(:movie)
			@fake_resualts = [mock('movi1'),mock('movie2')]
		end
		it "should call the module method find_same_director_movies" do 
			Movie.should_receive(:find_same_director_movies).with("1")
			.and_return(@fake_resualts)
			post :find_same_director_movies,:id => "1"
		end

		describe "after valid search" do
			before :each do 
				Movie.stub(:find_same_director_movies).with("1")
				.and_return(@fake_resualts)
				post :find_same_director_movies,:id => "1"
			end 

			it "should select the Same director movies template for rendering" do 
				response.should render_template('find_same_director_movies')
			end 
			it "should set the resualts available"  do 
				assigns(:same_director_movies).should == @fake_resualts
			end
		end

	end

end 