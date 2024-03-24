# digitValue

- _digitValue(aCharacter | aString | anInteger)_

In the `Character` or `String` case,
answer 0 - 9 for '0' - '9', 10 - 35 for 'A' - 'Z', and < 0 otherwise.
This is used to parse literal numbers of radix 2 - 36.

```
>>> '0'.digitValue
0

>>> '1'.digitValue
1

>>> ['9' '0' 'A' 'Z'].collect(digitValue:/1)
[9 0 10 35]
```

In the `Integer` case,
answer the `Character` whose digit value is _anInteger_.
For example, answer '9' for 9, '0' for 0, 'A' for 10, 'Z' for 35.

```
>>> 0.digitValue
'0'

>>> 1.digitValue
'1'

>>> [9 0 10 35].collect(digitValue:/1)
['9' '0' 'A' 'Z']
```

* * *

See also: asciiValue, codePoint, Character

Categories: Accessing
