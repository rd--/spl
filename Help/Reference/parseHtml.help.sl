# parseHtml

- _parseHtml(aDocument, aString)_

Answer a new `Node` in _aDocument_ that represents the document fragment at _aString_.
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
