# Edmunds

Ruby wrapper for the Edmunds Vehicle API (V2)

[![Codeship Status for bcavileer/edmunds_v2](https://codeship.io/projects/d71112a0-32ff-0132-09be-06d5924e9902/status)](https://codeship.io/projects/40542)
[![Code Climate](https://codeclimate.com/github/bcavileer/edmunds_v2/badges/gpa.svg)](https://codeclimate.com/github/bcavileer/edmunds_v2)
[![Test Coverage](https://codeclimate.com/github/bcavileer/edmunds_v2/badges/coverage.svg)](https://codeclimate.com/github/bcavileer/edmunds_v2)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edmunds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edmunds

## Usage

### Important! Create a .env file and add your EDMUNDS_API_KEY: <your api key>

REPL

    $ pry -r edmunds -c Edmunds
        pry(Edmunds)> ls
        >> constants: Api  Vehicle  VERSION
        >> Edmunds::Vehicle::Specification::Make#methods: make  makes  makes_count
        >> Edmunds::Vehicle::Specification::Model#methods: models_count
        
        pry(Edmunds)> makes_count
        >> 61 (really <#Edmunds::Api::ResponseProxy>)

Testing

    $ rspec

Testing against the real API

    $ VCR_OFF=1 rspec

Documenting

    $ rake yard:build       will build the documentation
    $ rake yard:publish     will push documentation to gh-pages

## Contributing

1. Fork it ( https://github.com/[my-github-username]/edmunds/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
