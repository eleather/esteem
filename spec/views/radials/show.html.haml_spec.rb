require 'spec_helper'

describe "radials/show.html.haml" do
  before(:each) do
    @radial = assign(:radial, stub_model(Radial,
      :name => "Name",
      :description => "MyText",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
