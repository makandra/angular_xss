shared_examples_for 'engine preventing Angular XSS' do

  it 'escapes Angular interpolation marks iff a string is unsafe' do
    engine = respond_to?(:view) ? view : template
    html = engine.render(partial)
    html.should include(" { { unsafe}}")
    html.should_not include("{{unsafe}}")
    html.should include("{{safe}}")
    html.should_not include(" { { safe}}")
  end

end
