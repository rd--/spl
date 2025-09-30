# isPunctuation

- _isPunctuation(s)_

Answer `true` if the string _s_ is punctuation, else `false`.

```
>>> '?'.isPunctuation
true

>>> '#,'.isPunctuation
true
```

The digit _1_ is not punctuation:

```
>>> '1'.isPunctuation
false
```

Letters are not punctuation:

```
>>> 'a'.isPunctuation
false
```

There are twenty six punctuations and each has two cases:

```
>>> 0:127
>>> .collect(asCharacter:/1)
>>> .select(isPunctuation:/1)
>>> .collect(codePoint:/1)
[
	33  34  35  37  38
	39  40  41  42  44
	45  46  47  58  59
	63  64  91  92  93
	95 123 125
]
```

* * *

See also: Character, isDigit, isLowerCase, isUpperCase, String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PunctuationCharacter.html)

Categories: Testing
