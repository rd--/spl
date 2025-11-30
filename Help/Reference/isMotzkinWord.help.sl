# isMotzkinWord

- _isMotzkinWord(w)_

Answer `true` if _w_ is a Motzkin word.

```
[
	2 2 1 0 0 1 1 2 0 2
	1 2 0 0 1 1 2 0
].isMotzkinWord
```

`motzkinWords` answers Motzkin words:

```
>>> motzkinWords(2, 1)
>>> .allSatisfy(isMotzkinWord:/1)
true
```

* * *

See also: isDyckWord, isLukasiewiczWord

Guides: Combinatorial Functions
