# keyAndValue

- _keyAndValue(k → v)_

Answer both the key and the value of an association.

```
>>> (1 -> 3).keyAndValue
[1 3]

>>> (1 -> 3).key
1

>>> (1 -> 3).value
3
```

Threads over lists:

```
>>> Association['x' 1; 'y' 2:; 'a' 0; 'b' -1]
>>> .keyAndValue
[
	'x' 1; 'y'  2
	:;
	'a' 0; 'b' -1
]
```

* * *

See also: Association, key, value

Guides: Dictionary Functions
