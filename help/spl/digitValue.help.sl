# digitValue -- accessing

- _digitValue(aCharacter)_

Answer 0 - 9 if the receiver is $0 - $9, 10 - 35 if it is $A - $Z, and < 0 otherwise.
This is used to parse literal numbers of radix 2 - 36.

- _digitValue(anInteger)_

Answer the Character whose digit value is _anInteger_.
For example, answer $9 for 9, $0 for 0, $A for 10, $Z for 35.

* * *

See also: asciiValue, Character
