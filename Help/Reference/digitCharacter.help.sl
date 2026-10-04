# digitCharacter

- _digitCharacter(n)_

Answer the character whose digit value is _n_.
For example, answer '9' for 9, '0' for 0, 'A' for 10, 'Z' for 35.

```
>>> 0.digitCharacter
'0'

>>> 1.digitCharacter
'1'

>>> 12.digitCharacter
'C'
```

Threads over lists:

```
>>> [9 0 10 35].digitCharacter
['9' '0' 'A' 'Z']
```

The inverse is `digitValue`:

```
>>> 'c'.digitValue
12

>>> ['9' '0' 'A' 'Z'].digitValue
[9 0 10 35]
```

* * *

See also: digitValue

Guides: Integer Functions, String Functions
