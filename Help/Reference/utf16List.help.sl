# utf16List

- _utf16List(s)_

Answer a `List` of the Utf-16 code points of the string _s_.

```
>>> '€'.utf16List
[8364]

>>> 'ΑΒΓαβγ'.utf16List
[913 914 915 945 946 947]
```

The inverse is `utf16String`:

```
>>> [8364].utf16String
'€'

>>> [913 914 915 945 946 947].utf16String
'ΑΒΓαβγ'
```

* * *

See also: String, utf8ByteArray, utf16String

Guides: String Functions
