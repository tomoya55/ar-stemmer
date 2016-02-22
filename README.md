# Ar-Stemmer

[![Build Status](https://travis-ci.org/tomoya55/ar-stemmer.svg?branch=master)](https://travis-ci.org/tomoya55/ar-stemmer)

Ar-Stemmer is pure Ruby port of Arabic Stemmer from Lucene.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ar-stemmer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar-stemmer

## Usage

```
require 'ar-stemmer'

ArStemmer.stem("الدونات")
# =>
"دونات"
```

When you want to turn off the specific rules for your own purpose, you can pass the name to `disable` option.

```
ArStemmer.stem(word, disable: [:yeh_noon, :waw_noon])
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
