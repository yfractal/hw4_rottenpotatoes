require 'spec_helper'

describe MoviesController do

	before :each do
		@director = 'Clint Eastwood'
		@id = 1
	end
	describe 'find same movie director' do 
		it "should call the model method that performs find by the movie's director" do
			fake_results = [mock('movie1'),mock('movie2')]
			Movie.should_receive(:find_same_director_movies).with(@id.to_s).and_return(fake_results)
			get :find_same_director_movies ,{:id => @id}
		end 

		it "should render this movie's director for searching" do
			fake_results = [mock('movie1'),mock('movie2')]
			Movie.stub(:find_same_director_movies).and_return(fake_results)
			get :find_same_director_movies ,{:id => @id}
			response.should render_template('find_same_director_movies')
		end

		it "should make the find_same_director_movies results available to that template" do
			fake_results = [mock('movie1'),mock('movie2')]
			Movie.stub(:find_same_director_movies).and_return(fake_results)
			post :find_same_director_movies ,{:id => @id}
			assigns(:movies).should == fake_results
		end 

	end
end 