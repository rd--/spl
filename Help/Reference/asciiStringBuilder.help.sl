# asciiStringBuilder

- _asciiStringBuilder(f/1)_

Evaluate _f_ at an empty collection,
and answer the `asciiString` of the mutated collection.

```
>>> { :c |
>>> 	c.addUtf8Encoded!('ascii')
>>> }.asciiStringBuilder
'ascii'
```

* * *

See also: addUtf8Encoded!, asciiString

Guides: String Functions
