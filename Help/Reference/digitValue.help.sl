# digitValue

- _digitValue(s)_

Answer 0 - 9 for '0' - '9', 10 - 35 for 'A' - 'Z', and < 0 otherwise.
This is used to parse literal numbers of radix 2 - 36.

```
>>> '0'.digitValue
0L

>>> '1'.digitValue
1L
```

Threads over lists:

```
>>> ['9' '0' 'A' 'Z'].digitValue
[9L 0L 10L 35L]
```

The inverse is `digitCharacter`:

```
>>> ['9' '0' 'A' 'Z']
>>> .digitValue
>>> .digitCharacter
['9' '0' 'A' 'Z']
```

* * *

See also: Character, asciiValue, codePoint, digitCharacter

Guides: Integer Functions, String Functions

Categories: Accessing
