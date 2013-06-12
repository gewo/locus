# Locus

[![Build Status](https://travis-ci.org/gewo/locus.png)](https://travis-ci.org/gewo/locus/)
[![Code Coverage](https://coveralls.io/repos/gewo/locus/badge.png)](https://coveralls.io/r/gewo/locus)

Get information about postal codes.

Currently only 'admin code1' is looked up (1. order subdivision (state)).

Uses data files from [geonames.org](http://geonames.org/).

## Installation

Add this line to your application's Gemfile:

    gem 'locus'

Or install it yourself as:

    $ gem install locus

## Usage

```ruby
Locus::Place.find_by_postal_code('12053', :de).state_code  # => 'BE'
```

A data file for DE, CH and AT is included with the gem. To update your
data file: 

```bash
wget http://download.geonames.org/export/zip/{DE,AT,CH}.zip
# unzip ...
rake locus:import:zip[postal_codes.yml,"DE.txt CH.txt AT.txt"]`
```

Tell the gem to use your updated data file:

```ruby
Locus.zip_path = '/path/to/updated/postal_codes.yml'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
