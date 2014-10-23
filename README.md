# Markup API ![Build Status](https://travis-ci.org/mmwtsn/markup-api.svg?branch=master)
## Description
"Markup API" is a JSON API that returns HTML for the IBM Cloud Marketing
properties. Can be consumed on the client-side with a [JSONP callback](http://en.wikipedia.org/wiki/JSONP).

Built for the IBM Cloud Lab.

## Usage

### Getting Started

To get started, make a GET request to the API endpoint. Here's a command line
example using cURL:

```bash
$ curl http://markup.content.ibmcloud.io/api/v1/cloud.json
```

By default, the endpoint will return a JSON
data object which can be used both on the server-side or the client-side. In
order to use the API on the client-side with AJAX, you'll need to use
[JSONP](http://en.wikipedia.org/wiki/JSONP) to work around the [same
origin policy](http://en.wikipedia.org/wiki/Same-origin_policy).

To trigger a JSONP response, simply append `?callback=MarkupAPI.render` to the request
like so:

```bash
$ curl http://markup.content.ibmcloud.io/api/v1/cloud.json?callback=MarkupAPI.render
```

### Data Structure

Each JSON object will contain two keys: `html` and `css`. Together, they
comprise all that is needed to render a fully-styled page component.

Here's an example response:

```json
{
  "html": "<h1>Hello World!</h1>",
  "css": "h1 { color: #333 }"
}
```

### Client-side Example

To use the API response on the client side you'll need to use JSONP.

Write a callback function called
`MarkupAPI.render` to handle the API response then simply call an API endpoint from a
`<script>` tag. Make sure to use the correct endpoint by appending 
`?callback=MarkupAPI.render` to your request.

Here's a simple implementation using jQuery:

```html
<script type="text/javascript" charset="utf-8">
  function MarkupAPI.render(data) {
    $('#target').append(data.html);
  }
</script>

<script src="http://markup.content.ibmcloud.io/api/v1/cloud.json?callback=MarkupAPI.render"></script>
```

## Demo
A working demo of the above approach can be [viewed
online](http://mmwtsn.github.io/markup-api/). The source code is available on
the [GitHub Pages](https://github.com/mmwtsn/markup-api/tree/gh-pages) branch of
this repository.

To reproduce the demo in your own application, you'll need four things:

- a script tag to call the API's JSONP endpoint
- a JavaScript function called `MarkupAPI.render` to handle the API response
- an HTML element with the id of `target` to accept the appended HTML
- jQuery

Start by [downloading](https://raw.githubusercontent.com/mmwtsn/markup-api/gh-pages/src/markup-jsonp-library.js)
the little library containing the `MarkupAPI.render` function into a local directory. We
named our directory "public" in this example. Source it at the bottom of your
page along with API call and jQuery (if it isn't already loaded).

```html
  <!-- Load jQuery from Google's CDN -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

  <!-- Load the teensy Markup API library -->
  <script src="public/markup-jsonp-library.js" type="text/javascript" charset="utf-8"></script>

  <!-- Call the Markup API -->
  <script src="http://markup.content.ibmcloud.io/api/v1/cloud.json?callback=MarkupAPI.render"></script>
</body>
```

Then add the `target` element wherever you wish. We put ours at the top of our
page as the HTML being sent by the API is a global masthead element:

```html
<div id="#target"></div>
```

## Author
[M. Maxwell Watson](http://mmwtsn.com/)

## License
©2014 M. Maxwell Watson. The Markup API Demo is free software, and may be
redistributed under the terms specified in the
[LICENSE](https://github.com/mmwtsn/markup-api/blob/master/LICENSE) file. The
IBM name and logo are trademarks of IBM and may not be used without permission.
