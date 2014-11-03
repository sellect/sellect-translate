# Sellect::Translate

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'sellect-translate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sellect-translate

## Create translation table

Add migration table to your Application:

    $ rails g sellect:translate:install

Install migration table:

    $ rake db:migrate

## Usage

For each class where columns require translation:

- Hook in ActiveRecord association
- Indicate which columns to translate using translate_fields method

```ruby
class Product

  has_many :translations, as: :translatable     # set association
  translate_fields :name, :description          # identify translatable columns

end


## Contributing

1. Fork it ( https://github.com/[my-github-username]/sellect-translate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
