# Mozaic

[![Gem Version](https://badge.fury.io/rb/mozaic.svg)](https://badge.fury.io/rb/mozaic) <img src="https://travis-ci.org/jonhue/mozaic.svg?branch=master" />

Mozaic is an opinionated layout engine for Rails. It simplifies handling numerous layouts and components.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Layouts](#layouts)
    * [Components](#components)
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

    $ rails g mozaic:install

---

## Usage

### Layouts

You can run a generator to create new layouts

    $ rails g mozaic:layout -n my/new/layout

**Note:** Pass the `-e` option to extend another layout with this new layout.

You can use the `mozaic` helper to extend other layouts:

```haml
= mozaic :layout do
    ...
```

`mozaic` takes the layout you want to extend as a first and the area where content should be rendered as a second parameter. Both of them default to `:mozaic`.

Here is how you specify areas to extend layouts:

```haml
= mozaic_area :area do
    ...
```

**Note:** Make sure that your area names are unique across all layouts.

### Components

Mozaic allows you to define components to organize your code:

    $ rails g mozaic:component -n name

```ruby
Mozaic.configure do |config|
    config.define_component :name
end
```

You are also able to pass default options to your components:

```ruby
Mozaic.configure do |config|
    config.define_component :name, lovely: true
end
```

```haml
= options[:lovely].to_s
```

You can run custom code whenever your component gets rendered:

```ruby
Mozaic.configure do |config|
    config.define_component :name, lovely: true do |options|
        options[:lovely] = !options[:lovely]
        options
    end
end
```

Return `false` in the block to return `nil` instead of rendering the component:

```ruby
Mozaic.configure do |config|
    config.define_component :name, lovely: true do |options|
        false unless options[:lovely] == true
    end
end
```

Components can also be defined in your ActiveRecord classes:

```ruby
class User < ApplicationRecord
    define_component :avatar
end
```

Rendering components is fairly straight forward:

```haml
= component :name
```

You are able to override the default options:

```haml
= component :name, lovely: false
```

And to pass a block:

```haml
= component :name, lovely: false do
    It is lovely.
```

Here is how to access a block in your component:

```haml
= options[:lovely].to_s
= block
```

### Assets

#### Webpack (ES6)

The component generator generates asset files in your [configured](#configuration) directories.

The JavaScript assets use ES6 by default. You can now import a component:

```javascript
import ComponentName from 'mozaic/component/name';
let componentName = new ComponentName(document.querySelector('.mozaic-component.document-name'));
```

#### Sprockets

With Mozaic you can automatically add assets to the asset pipeline by naming them like the component they belong to. Just require Mozaic in your application assets:

```javascript
//= require_tree ./mozaic
```
```css
/*
 *= require_tree ./mozaic
 */
```

For instance a component with the name `'my/test/component'` can have a javascript asset located at `app/assets/javascripts/mozaic/my/test/component.js` and a stylesheet under `app/assets/stylesheets/mozaic/my/test/component.css`.

**Note:** Asset files are being created automatically when using the component generator.

---

## Configuration

You can configure Mozaic by passing a block to `configure`. This can be done in `config/initializers/mozaic.rb`:

```ruby
Mozaic.configure do |config|
    config.define_component :name
end
```

* `define_component` Define components
* `es6` Whether generated JavaScript assets for components should use ES6 syntax or not. Accepts a boolean. Defaults to `true`.
* `javascripts` Directory to place JavaScript assets for components in. Accepts a string. Defaults to `'app/javascript/javascripts'`.
* `stylesheets` Directory to place styleshets for components in. Accepts a string. Defaults to `'app/javascript/stylesheets'`.

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
