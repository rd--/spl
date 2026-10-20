# splitOn

- _splitOn([x₁ x₂ …], [y₁ …])_

Split the sequence or string _x_,
by the sub-sequence or sub-string _y_.
The separator is discarded.
At `Sequence` this is an alias for `sequenceSplit`,
at `String` this is an alias for `stringSplit`.

At `List`:

```
>>> [1 2 3 0 4 5 6 0 7 8 9].splitOn([0])
[1 2 3; 4 5 6; 7 8 9]
```

At `String`,
split into a `List` of `String`s,
according to the separator,
which is also a `String`:

```
>>> 'a,b,c'.splitOn(',')
['a' 'b' 'c']
```

* * *

See also: join, split, stringJoin, stringSplit

Guides: List Functions, String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/split/docs/Data-List-Split.html#v:splitOn),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceSplit.html)
[2](https://reference.wolfram.com/language/ref/StringSplit.html)

Categories: String
