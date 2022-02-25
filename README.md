### Hexlet tests and linter status:
[![Actions Status](https://github.com/Vasyll/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/Vasyll/rails-project-lvl1/actions)
![CI status](https://github.com/Vasyll/rails-project-lvl1/actions/workflows/master.yml/badge.svg)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

HexletCode is a library for generating forms. It takes on tasks that usually require writing a lot of boilerplate code. This generator is similar in concept to Simple Form, but much simpler. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

Example:

```ruby
User = Struct.new(:name, :job, keyword_init: true)
```

```ruby
user = User.new name: 'rob'

HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
  f.submit
end
```
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input type="text" name="name" value="rob" class="user-input">
  <label for="job">Job</label>
  <input type="text" name="job">
  <input type="submit" value="Save">
</form>
```

```ruby
user = User.new job: 'hexlet'

HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Wow'
end
```

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input type="text" name="name">
  <label for="job">Job</label>
  <textarea name="job" rows="50" cols="50">hexlet</textarea>
  <input type="submit" value="Wow">
</form>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.
