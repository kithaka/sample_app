require 'spec_helper'

describe "User Pages" do
	before do
    @user=User.create(:name=>"Example User", :email=>"user@example.com",
                     :password=>"foobar", :password_confirmation=>"foobar")
end
  subject {page}
  describe "index page" do
  before {visit users_path}
  it {should have_selector('h1', :text=>"All users")}
  it {should have_selector('title', :text=>"All users")}
end
  describe "signup page" do
    before {visit signup_path}

    it {should have_selector('h1', :text=>'Sign up')}
    it {should have_selector('title', :text=>'Sign up')}
    describe "signup" do
    	before {visit signup_path}
    	let(:submit) {"Create my account"}
    	describe "with invalid information" do
    		it "shoul not create a user" do
    			expect {click_button submit}.not_to change(User, :count)
    		end
    	end
    	describe "with valid information" do
    		before do
    			fill_in "Name", with: "Example User"
    			fill_in "Email", with: "user@example.com"
    			fill_in "Password", with: "foobar"
    			fill_in "Confirmation", with: "foobar"
    		end
    		it "should create a user" do
    			expect {click_button submit}.to change(User, :count).by(1)
    		end
    	end
  end
end
  describe "profile page" do
  	before {visit user_path(@user)}
  	it {should have_selector('h1', text: @user.name)}
  	it {should have_selector('title', text: @user.name)}
end
end