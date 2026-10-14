# asciiStringBuilder

- _asciiStringBuilder(f/1)_

Evaluate _f_ at an empty collection,
and answer the `asciiString` of the mutated collection.

```
>>> { :c |
>>> 	c.addUtf8Encoded!('bodlɛʁ')
>>> }.utf8StringBuilder
'bodlɛʁ'
```

* * *

See also: addUtf8Encoded!, utf8String

Guides: String Functions
