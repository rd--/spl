# digitValue

- _digitValue(c)_

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

* * *

See also: asciiValue, codePoint, Character, digitCharacter

Categories: Accessing
