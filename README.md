angular_xss
===========

When rendering AngularJS templates with a server-side templating engine like ERB or Haml it is easy to introduce XSS vulnerabilities. These vulnerabilities are enabled by AngularJS evaluating user-provided strings containing interpolation symbols (default symbols are `{{` and `}}`).

This gem patches ERB/rails_xss and Haml so Angular interpolation symbols are auto-escaped in unsafe strings. And by auto-escaped we mean replacing `{{` with ` { { `.

**This is an unsatisfactory hack.** A better solution is very much desired, but might not be possible without significant refactoring of AngularJS. See the [related AngularJS issue](https://github.com/angular/angular.js/issues/5601).


Installation
------------

0. Read the code so you know what you're getting into.

1. Put this into your Gemfile **after other templating engines** like Haml or Erubis:

       gem 'angular_xss' # put me after Haml, Erubis and other templating engines

2. Run `bundle install`.

3. Run your test suite to find the places that broke.

4. Mark any string that is allowed to contain Angular expressions as `#html_safe`.


Known issues
------------
- Requires Haml. Could be refactored to only patch ERB/rails_xss.


Development
-----------

- Fork the repository.
- Push your changes with specs. There is a Rails 3 test application in `spec/app_root` if you need to test integration with a live Rails app.
- Send a pull request.


Credits
-------

[Henning Koch](mailto:henning.koch@makandra.de) from [makandra](http://makandra.com/).
