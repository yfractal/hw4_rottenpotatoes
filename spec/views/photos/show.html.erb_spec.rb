require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :name => "Name",
      :description => "Description"
                                       )
                    )

  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/) #should "Name"
    rendered.should match(/Description/)
  end
end
