# letterCounts

- _letterCounts(s, n=1)_

Answer an association list whose keys are the distinct letters in the string _s_,
and whose values give the number of times those letters appear.

Count the distinct letters in a string:

```
>>> 'banana'.letterCounts
['a' -> 3, 'n' -> 2, 'b' -> 1]

>>> 'ACCCAAGCTTAA'.letterCounts
['A' -> 5, 'C' -> 4, 'T' -> 2, 'G' -> 1]
```

Count the distinct _n_-gram letter sequences in a string:

```
>>> 'aaaaaaaaaaaaa'.letterCounts(5)
['aaaaa' -> 9]

>>> 'banana'.letterCounts(2)
['na' -> 2, 'an' -> 2, 'ba' -> 1]

>>> 'tomato'.letterCounts(2)
['to' -> 2, 'at' -> 1, 'ma' -> 1, 'om' -> 1]

>>> 'abababababababababab'
>>> .letterCounts(2)
['ab' -> 10, 'ba' -> 9]

>>> 'abABabABabABabABabAB'
>>> .letterCounts(2)
['AB' -> 5, 'bA' -> 5, 'ab' -> 5, 'Ba' -> 4]
```

With `asLowerCase` ignores case:

```
>>> 'Alabama'.asLowerCase.letterCounts
['a' -> 4, 'm' -> 1, 'b' -> 1, 'l' -> 1]
```

Non-letter characters are excluded from letter counts,
unlike `characterCounts`:

```
>>> 'YT-1300'.letterCounts
['T' -> 1, 'Y' -> 1]

>>> 'YT-1300'.characterCounts
[
	'0' -> 2, '3' -> 1, '1' -> 1,
	'-' -> 1, 'T' -> 1, 'Y' -> 1
]
```

* * *

See also: characterCounts, counts, isLetter, keySort, size, sort, wordCounts

Guides: String Functions

References:
_Mathematica_
[1](http://reference.wolfram.com/language/ref/LetterCounts.html)
