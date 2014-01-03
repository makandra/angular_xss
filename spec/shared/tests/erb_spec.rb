require 'spec_helper'

describe 'Angular XSS prevention in ERB', :type => :view do

  it_should_act_like 'engine preventing Angular XSS', :partial => 'test/test_erb'

end
