# Grunt Source - jQuery

> A Grunt environments for building jQuery Plugins

## Usage

``` shell
npm install -g grunt-source grunt-cli
```

Create a `Gruntsource.json` file in your plugin's root:

``` json
{
  "source": "~/.grunt-sources/jquery",
  "repo": "https://github.com/jpillora/grunt-source-jquery.git"
}
```

*Note: you can the directory by changing the `source` property.*

Then run:

``` shell
grunt-source
```

## Features

* Optionally uses CoffeeScript
* Constructs your `<name>.jquery.json` plugin descriptor
* Minifies your source
* Adds a neat banner

#### MIT License

Copyright © 2013 Jaime Pillora &lt;dev@jpillora.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
