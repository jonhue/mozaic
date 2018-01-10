# Mozaic

[![Gem Version](https://badge.fury.io/rb/mozaic.svg)](https://badge.fury.io/rb/mozaic) <img src="https://travis-ci.org/jonhue/mozaic.svg?branch=master" />

Mozaic is an opinionated layout engine for Rails. It simplifies handling numerous layouts and components.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

Mozaic works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'mozaic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mozaic

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'mozaic', github: 'jonhue/mozaic'
```

Now run the generator:

    $ rails g mozaic

---

## Usage

...

---

## Configuration

You can configure Mozaic by passing a block to `configure`. This can be done in `config/initializers/mozaic.rb`:

```ruby
Mozaic.configure do |config|
    config.define_component :name
end
```

* `define_component`

---

## To Do

[Here](https://github.com/jonhue/mozaic/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/mozaic/issues/new).

---

## Contributing

We hope that you will consider contributing to Mozaic. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/mozaic/graphs/contributors

### Semantic Versioning

Mozaic follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
