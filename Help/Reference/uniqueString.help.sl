# uniqueString

- _uniqueString(s)_

Answer a copy of the string _s_ with a unique identifier appended.
The appended identifier is given by `uniqueIdentifier`.

```
>>> 'x'.uniqueString
'x%'.format([system.uniqueIdentifier - 1])
```

* * *

See also: String, uniqueIdentifier

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unique.html),
