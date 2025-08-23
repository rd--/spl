# isLetter

- _isLetter(s)_

Answer `true` if the string _s_ represents a letter, else `false`.

Lower case _x_ is a letter:

```
>>> 'x'.isLetter
true
```

Upper case _Y_ is a letter:

```
>>> 'Y'.asCharacter.isLetter
true
```

The digit _1_ is not a letter:

```
>>> '1'.isLetter
false
```

Comma is not a letter:

```
>>> ','.isLetter
false
```

There are twenty six letters and each has two cases:

```
>>> let ascii = 0:255.collect(asCharacter:/1);
>>> ascii.select(isLetter:/1).size
2 * 26
```

* * *

See also: Character, isDigit, isLowerCase, isUpperCase

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LetterQ.html),
_Smalltalk_
5.3.4.8

Categories: Testing
