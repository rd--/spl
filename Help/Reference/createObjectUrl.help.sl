# createObjectUrl

- _createObjectUrl(x)_

Answer a `String` holding a `Url` that represents the data at _x_,
which should be either a `File` or `BinaryLargeObject`.

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetchBinaryLargeObject
.then { :answer |
	answer
	.createObjectUrl
}
~~~

* * *

See also: revokeObjectUrl

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/API/URL/createObjectURL_static)
_W3c_
[1](https://w3c.github.io/FileAPI/#dfn-createObjectURL)

Categories: Network, Address
