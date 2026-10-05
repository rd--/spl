# parseHtml

- _parseHtml(d, s)_

Answer a new `Node` in the document _d_ that represents the document fragment at the string _s_.
Implemented using the _template_ element type.

Create a _paragraph_ element:

~~~spl document
system
.window
.document
.parseHtml('<p>A paragraph.</p>')
~~~

* * *

See also: DocumentFragment, Html, HTMLTemplateElement
