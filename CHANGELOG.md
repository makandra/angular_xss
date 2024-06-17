# Changelog
All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Unreleased

### Compatible changes
* Add compatibility with Rails 7.1
* Add compatibility with HAML 6
  * NOTE: Don't use HAML 6.0.0. AngularXSS relies on a patch [introduced in 6.0.1](https://github.com/haml/haml/blob/main/CHANGELOG.md#601). Anything newer should be fine - the gem is currently tested against HAML 6.3
* Refactor our patches to use `Module#prepend` instead of `Module#module_eval`
* Refactor gem version comparisons to use `Gem::Version` instances
* Refactor specs to use the `expect` syntax
* Add missing unit tests for patched methods
* Improve test coverage for more interpolation scenarios in ERB and HAML

### Breaking changes


## 0.4.1 2022-03-16

### Compatible changes

- Add compatibility with Rails 7
- Require MFA for RubyGems

## 0.4.0 2021-08-23

### Compatible changes

- Add compatibility with Rails 6
- Add compatibility with Haml > 5.2
- Add compatibility with Ruby 2.7 and Ruby 3

## 0.3.1 2017-11-21

### Compatible Changes

- Add compatibility with Rails 5
- Add compatibility with Haml 5

## 0.3.0 2017-07-31

### Breaking changes

- Changed the way Angular XSS escapes double braces from ` { { ` to
  `{{ $root.DOUBLE_LEFT_CURLY_BRACE }}`. This requires a change in the
  application code. Check the [README](https://github.com/makandra/angular_xss/blob/master/README.md#installation)
  for details.

## 0.2.3 2015-04-17

### Compatible changes

- Fix a bug where an unexpected nil value would cause problems

## 0.2.2 2015-04-17

### Compatible changes

- Support Rails 4.2

## 0.2.1 2015-04-13

### Compatible changes

- Fix escaping of precompiled attributes in Haml templates

## 0.2.0 2015-04-13

### Compatible changes

- Add option to disable escaping temporarily via `AngularXss.disable do ... end`

## 0.1.1 2014-01-04

### Compatible changes

- Require Haml >= 3.1.5 (lower Hamls don't escape element attribute values)

## 0.1.0 2014-01-03

### Compatible changes

- First version.
