# utf16List

- _utf16List(aString)_

Answer a `List` of the Utf-16 code points of _aString_.

```
>>> '€'.utf16List
[8364]

>>> 'ΑΒΓαβγ'.utf16List
[913 914 915 945 946 947]
```

* * *

See also: String, utf8ByteArray
