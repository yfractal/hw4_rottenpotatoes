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

	describe "co test" do 
		before :each do 
			@m_new = FactoryGirl.build(:movie)
			@m = FactoryGirl.create(:movie)
		end			
		it "index" do 
			get :index
			assigns(:movies).count.should eq(1)
		end
		it "do not have title" do
			@m_without_title = FactoryGirl.create(:movie,:director => '')
			post :find_same_director_movies,:id => @m_without_title.id
			assigns(:same_director_movies).should == []
		end

		it "create" do 
			post :create,:movie => @m_new
		end

		it "delete" do
			movie = FactoryGirl.create(:movie)
			expect {
			  delete :destroy, {:id => movie.to_param}
			}.to change(Movie, :count).by(-1)

		end
		it "show" do 
			get :show,:id => @m.id
			assigns(:movie).should == @m
		end
		it "edit" do
		  get :edit, {:id => @m.to_param}
		  assigns(:movie).should eq(@m)
		end

		it "update" do 
			put :update, {:id => @m.to_param}
			response.should	redirect_to(movie_path(@m))					
		end

	end

end 