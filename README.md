# Automation API Test with RSpec

How to setup automation api test using RSpec & Faraday
## Installation

Run `bundle init` to generate Gemfile & add some library on Gemfile

```bash
  bundle init
```

- dotenv
- faker
- faraday
- json
- json-schema
- rspec
- rubocop


Run `bundle install` to install some library on Gemfile and auto generate gemfile.lock
```bash
  bundle install
```

Create your project to use RSpec
```bash
  rspec --init
```
you'll see .rspec & spec_helper.rb generated

Create new folder 
- config (contains payload, schema & test_data)
- helper
- lib
- reports


## Running Tests

To run tests, run the following command

```bash
  rspec -f doc
```
or 
```bash
  rspec -f html -o reports/rspec_results.html
```


## Acknowledgements

 - [RSpec](https://rspec.info/)
 - [Faraday](https://lostisland.github.io/faraday/#/)

