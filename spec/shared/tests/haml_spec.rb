require 'spec_helper'

describe 'Angular XSS prevention in Haml', :type => :view do

  it_should_act_like 'engine preventing Angular XSS', :partial => 'test/test_haml'

end
