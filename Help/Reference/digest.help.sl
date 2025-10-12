# digest

- _digest(d, a='SHA-256')_

Answer a digest of the data _d_ using the algorithm _a_.

At `ByteArray` promises a `ByteArray`:

```
>>> let d = [
>>> 	11 244 116 137  99  99  80  94
>>> 	94 165 229 214 172 232 235 251
>>> 	19 167  96 164   9 177 251  70
>>> 	125  66 143 199  22 249 242 132
>>> ].asByteArray;
>>> 'digest'
>>> .utf8ByteArray
>>> .digest('SHA-256').then { :x |
>>> 	{ x = d }.assert
>>> }.isPromise
true
```

At `String` promises a Base-16 encoded string:

```
>>> let d = [
>>> 	'0BF474896363505E'
>>> 	'5EA5E5D6ACE8EBFB'
>>> 	'13A760A409B1FB46'
>>> 	'7D428FC716F9F284'
>>> ].stringJoin;
>>> 'digest'
>>> .digest('SHA-256')
>>> .then { :x |
>>> 	{ x = d }.assert
>>> }.isPromise
true
```

* * *

See also: base16Encode, hash

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Hash.html),
_W_
[1](https://en.wikipedia.org/wiki/SHA-2)
