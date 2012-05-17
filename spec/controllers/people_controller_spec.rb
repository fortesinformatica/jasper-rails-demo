require 'spec_helper'

describe PeopleController do
	describe "GET listagem" do
    before do
      Person.stub(:all).and_return([Person.new(:name=>'Teste', :email=>'tet@tet.com'), Person.new(:name=>'Teste2', :email=>'tet2@tet.com')])
    end
    
    it "be success" do
      response.should be_success
    end
    
    it "dont have nulls" do
      get :index, :format => :pdf
      response.should_not contain("null")
    end

    it "contains email" do
      get :index, :format => :pdf
      response.should contain("tet@tet.com")
    end
	end
end