# withCollectEqual

- _withCollectEqual(aSequence, anotherSequence, aBlock:/2)_

Answer a Block that will apply _aBlock_ element wise to two sequences of equal length.

```
>>> ['1' '2' '3'].withCollectEqual(['4' '5' '6'], ++)
['14' '25' '36']
```

It is an error if the sequences are not of equal size:

```
>>> { [1 2 3].withCollectEqual([4 5], +) }.ifError { true }
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
