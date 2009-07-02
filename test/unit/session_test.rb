require 'test_helper'

class SessionTest < Test::Unit::TestCase
  context "A Session instance" do
    setup do
      Ken::Logger.new(STDOUT, :info)
      Ken::Session.new('http://www.freebase.com', 'ma', 'xxxxx')
    end
  
    should 'return the correct set of types' do
      result = Ken.session.mqlread({:id => "/en/the_police", :type => []})
      result['type'].length.should == 6
    end

    should 'raise a Ken::MqlReadError if node does not exist' do
      lambda { Ken.session.mqlread({:id => "/en/the_police", :evil_property => []}) }.should raise_error(Ken::ReadError)
    end
  end # context
end # SessionTest