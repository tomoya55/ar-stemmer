# Ar-Stemmer

[![Build Status](https://travis-ci.org/tomoya55/ar-stemmer.svg?branch=master)](https://travis-ci.org/tomoya55/ar-stemmer)

Ar-Stemmer is a Ruby port of Arabic Stemmer from Lucene with some extensions.

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

When you want to turn on/off the specific rules for your own purpose, you can pass the name to `only/except` option.

```
ArStemmer.stem(word, only: [:alef_lam, :waw_alef_lam])
ArStemmer.stem(word, except: [:yeh_noon, :waw_noon])
```

You can find the rule names in [the source code](https://github.com/tomoya55/ar-stemmer/blob/master/lib/ar_stemmer.rb#L18-L40).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
