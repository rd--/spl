# stringReplace

- _stringReplace(s, a→b)_
- _stringReplace(s, [a₁→b₁ a₂→b₂ …])_

Replace _a_,
which may be a string or a regular expression,
by the string _b_ wherever it appears in the string _s_.

Replace every occurrence of _ab_ with a period:

```
>>> 'abbaabbaa'
>>> .stringReplace('ab' -> '.')
'.ba.baa'
```

Use a regular expression:

```
>>> let a = RegularExpression('[ab]', 'g');
>>> 'abcd acbd'.stringReplace(a -> '..')
'....cd ..c..d'
```

Replace occurrences of either string:

```
>>> 'abcdabcdaabcabcd'
>>> .stringReplace(
>>> 	['abc' -> 'Y', 'd' -> '...']
>>> )
'Y...Y...aYY...'
```

Works on special characters:

```
>>> 'product: A ⨁ B'
>>> .stringReplace('⨁' -> 'x')
'product: A x B'
```

Threads over lists:

```
>>> ['aaabbbbaaaa' 'bbbaaaab' 'aaabab']
>>> .stringReplace('ab' -> '.')
['aa.bbbaaaa' 'bbbaaa.' 'aa..']
```

Change the nucleotides in a biomolecular sequence:

```
>>> 'ATGGCGGT'
>>> .stringReplace('GG' -> 'TC')
'ATTCCTCT'
```

A neighbor-independent substitution system:

```
>>> let r = ['.' -> '.,', ',' -> ',.'];
>>> { :s |
>>> 	s.stringReplace(r)
>>> }.nestList('.', 5)
[
	'.'
	'.,'
	'.,,.'
	'.,,.,..,'
	'.,,.,..,,..,.,,.'
	'.,,.,..,,..,.,,.,..,.,,..,,.,..,'
]
```

Remove whitespace from a string:

```
>>> '1 2 3 4 5 6 7 8 9'
>>> .stringReplace(' ' -> '')
'123456789'
```

* * *

See also: replaceMultipleStrings, replaceStringAll, stringDelete

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringReplace.html),
