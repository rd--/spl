# BitSet

- _BitSet(c, n)_

Answer a new `BitSet` from the collection _c_ with capacity _n_.
The capacity is fixed and need not be a multiple of eight.

A `BitSet` is a `Dictionary`-like data structures mapping 0-1 values to integers between `zero` and _n-1_.

`BitSet` implements three different kind of protocols,
each corresponding to a way of thinking about this data structure.

A `Set`-like protocol:

- `add`
- `remove`
- `includes`

A `Dictionary`-like protocol:

- `at`
- `atPut`

A `Binary`-like protocol:

- `bitAt`
- `clearBitAt`
- `setBitAt`

A new `BitSet` is empty, the `size` of a `BitSet` is the number of non-zero bits:

```
>>> let b = BitSet([], 7);
>>> (b.capacity, b.size, b.isEmpty)
(7, 0, true)
```

All bytes at the empty `BitSet` are `zero`:

```
>>> BitSet([], 64)
>>> .bytes
>>> .allSatisfy { :each |
>>> 	each = 0
>>> }
true
```

`asBitSet` constructs a `BitSet` from a `List` of integers.
The `capacity` is set to one more than the largest index.
`asList` answers a `List` of the indices which have bits set.

```
>>> let b = [1 3 9].asBitSet;
>>> (b.capacity, b.asList)
(10, [1 3 9])
```

Add three integers to a `BitSet`:

```
>>> let b = BitSet([], 64);
>>> b.add(1);
>>> b.add(3);
>>> b.add(9);
>>> (b.size, b.asList)
(3, [1 3 9])
```

Adding the same integer over again is not allowed,
however including it is:

```
>>> let b = BitSet([], 64);
>>> b.add(5);
>>> b.include(5);
>>> b.include(5);
>>> (b.size, b.asList)
(1, [5])
```

`BitSet` implements the predicate `includes`:

```
>>> [1 3 9].asBitSet
>>> .includes(3)
true

>>> let b = [1 3 9].asBitSet;
>>> [1, 3 .. 9].collect { :each |
>>> 	b.includes(each)
>>> }
[true true false false true]

>>> let b = '101001'.asBitSet;
>>> [0 2 5].collect { :each |
>>> 	b.includes(each)
>>> }
[true true true]
```

A three element `BitSet`, set entries using `atPut` which requires `zero` or `one` values:

```
>>> let b = BitSet([], 64);
>>> b[1] := 1;
>>> b[3] := 1;
>>> b[9] := 1;
>>> (b.size, b.asList)
(3, [1 3 9])
```

Read entries using `at`, which answers `zero` or `one` values:

```
>>> let b = [1 3 9].asBitSet;
>>> [1, 3 .. 9].collect { :each |
>>> 	b[each]
>>> }
[1 1 0 0 1]
```

Add elements using `addAll` and iterate over indices using `do`:

```
>>> let b = BitSet([], 64);
>>> let c = [1 3 9 27];
>>> let l = [];
>>> b.addAll(c);
>>> b.do { :each |
>>> 	l.add(each)
>>> };
>>> (b.size, l)
(4, [1 3 9 27])
```

Copy `BitSet` and mutate copy:

```
>>> let b = [1 7].asBitSet;
>>> let c = b.copy;
>>> c.add(3);
>>> (b, c)
([1 7].asBitSet, [1 3 7].asBitSet)
```

`bitAt` is equal to `at`:

```
>>> [1 3 9].asBitSet
>>> .bitAt(3)
1
```

`setBitAt` is equal to `add`:

```
>>> let b = BitSet([], 64);
>>> b.setBitAt(3);
>>> b.bitAt(3)
1
```

`clearBitAt` is equal to `remove`:

```
>>> let b = [1 3 9].asBitSet;
>>> b.clearBitAt(3);
>>> b.asList
[1 9]
```

`asString` answers a `String` of `capacity` places with '0' for indices that are 0 and '1' for indices that are 1:

```
>>> [0 2 4 5 7 9 11].asBitSet
>>> .asString
'101011010101'

>>> BitSet([0 2 5], 8)
>>> .asString
'10100100'
```

The `printString` of a `BitSet`:

```
>>> [0 2 4 5 7 9 11]
>>> .asBitSet
>>> .printString
'BitSet([0, 2, 4, 5, 7, 9, 11], 12)'
```

`bitNot` at `BitSet` flips the status of each bit:

```
>>> let b = [0 2 4 5 7 9 11].asBitSet;
>>> b.bitNot;
>>> b.asList
[1 3 6 8 10]
```

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = l.asBitSet;
>>> (b.asList, b.complement.asList)
(l, [1 3 6 8 10])
```

* * *

See also: add, asBitSet, at, atPut, bitAt, clearBitAt, includes, remove, ResidueSet, setBitAt

Guides: Bitwise Functions

Categories: Collection, Type
