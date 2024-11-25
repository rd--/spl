# DocumentRange

A `Type` representing a fragment of a `Document` that can contain nodes and parts of text nodes.

Ranges can be retrieved from a `Selection` object.

The `startContainer` and `startOffset` say where the range begins,
the `endContainer` and `endOffset` say where the range ends.
The `commonAncestorContainer` tells the nearest antedent that contains both the start and end nodes.
If the start and end of the range are at the same position the range answers `true` to the predicate `collapsed`.
A range can be collapsed using `collapse`.

The `toString` method answers the text of the range as a `String`.

* * *

See also: Document, Selection, Window

References:
_W3c_
[1](https://dom.spec.whatwg.org/#interface-range)
