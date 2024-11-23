# matchesRegExp

- _matchesRegExp(aString, aRegExp)_

Answers true if _aString_ matches _aRegExp_, else false.
The expression to match is read using `asRegExp`, so an uncompiled regular expression may be used.

```
>>> 'caddar'.matchesRegExp('c(a|d)+r')
true

>>> 'acggtaagc'.matchesRegExp('[acgt]+')
true
```

* * *

See also: RegExp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringMatchQ.html)

Categories: Testing
