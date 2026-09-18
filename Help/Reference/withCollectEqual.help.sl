# withCollectEqual

- _withCollectEqual([x₁ x₂ …], [y₁ y₂ …], f/2)_

Answer a `Block` that will apply the block _f_ element wise to two sequences _x_ and _y_ of equal length.

```
>>> ['1' '2' '3']
>>> .withCollectEqual(
>>> 	['4' '5' '6'],
>>> 	++
>>> )
['14' '25' '36']
```

It is an error if the sequences are not of equal size:

```
>>> {
>>> 	[1 2 3].withCollectEqual([4 5], +)
>>> }.hasError
true
```

There is also an _adverbial_ form, currently called _e_:

```
>>> ['1' '2' '3'] ++.e ['4' '5' '6']
['14' '25' '36']
```

* * *

See also: withCollect

Guides: Operator Adverbs
