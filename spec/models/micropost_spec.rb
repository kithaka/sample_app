require 'spec_helper'

describe Micropost do
	before do
		@micropost=@user.microposts.new(:content=>"Lorem ispum")
	end
	subject {@micropost}
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should be_valid}
	describe "when content is not present" do
		before {@micropost.content=""}
		it {should_not be_valid}
	end
end
