# BitSet

- _BitSet([b₁ b₂ …])_
- _BitSet([i₁ i₂ …], n)_

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

A new `BitSet` is empty.
The `size` of a `BitSet` is the number of non-zero bits,
equivalently the `bitCount`:

```
>>> let b = BitSet([], 7);
>>> (
>>> 	b.capacity,
>>> 	b.size,
>>> 	b.bitCount,
>>> 	b.isEmpty
>>> )
(7, 0, 0, true)
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

The binary form of `BitSet` constructs a `BitSet` from a `List` of integers,
with the specified `capacity`.
Valid indices start from `zero` and run to one less than the capacity:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = BitSet(l, 12);
>>> (b.capacity, b.size, b.asString)
(12, 7, '101011010101')
```

`positionVector` answers a `List` of the indices which have bits set.

```
>>> let b = BitSet([1 3 9], 12);
>>> (b.capacity, b.positionVector)
(12, [1 3 9])
```

Add three integers to a `BitSet`:

```
>>> let b = BitSet([], 64);
>>> b.add(1);
>>> b.add(3);
>>> b.add(9);
>>> (b.size, b.positionVector)
(3, [1 3 9])
```

Adding the same integer over again is not allowed,
however including it is:

```
>>> let b = BitSet([], 64);
>>> b.add(5);
>>> b.include(5);
>>> b.include(5);
>>> (b.size, b.positionVector)
(1, [5])
```

`BitSet` implements the predicate `includes`:

```
>>> BitSet([1 3 9], 12)
>>> .includes(3)
true

>>> let b = BitSet([1 3 9], 12);
>>> [1, 3 .. 9].collect { :each |
>>> 	b.includes(each)
>>> }
[true true false false true]
```

The unary form of `BitSet` accepts a bit vector,
either as a list or as a string:

```
>>> let b = BitSet([1 0 1 0 0 1]);
>>> [0 2 5].collect { :each |
>>> 	b.includes(each)
>>> }
[true true true]

>>> let b = BitSet('101011010101');
>>> (b.capacity, b.size, b.positionVector)
(12, 7, [0 2 4 5 7 9 11])
```

A three element `BitSet`, set entries using `atPut` which requires `zero` or `one` values:

```
>>> let b = BitSet([], 64);
>>> b[1] := 1;
>>> b[3] := 1;
>>> b[9] := 1;
>>> (b.size, b.positionVector)
(3, [1 3 9])
```

Read entries using `at`, which answers `zero` or `one` values:

```
>>> let b = BitSet([1 3 9], 12);
>>> [1, 3 .. 9].collect { :each |
>>> 	b[each]
>>> }
[1 1 0 0 1]
```

Add elements using `addAll` and iterate over indices using `positionsDo`:

```
>>> let b = BitSet([], 64);
>>> let c = [1 3 9 27];
>>> let l = [];
>>> b.addAll(c);
>>> b.positionsDo { :each |
>>> 	l.add(each)
>>> };
>>> (b.size, l)
(4, [1 3 9 27])
```

Copy `BitSet` and mutate copy:

```
>>> let b = BitSet([1 7], 12);
>>> let c = b.copy;
>>> c.add(3);
>>> (b, c)
(
	BitSet([1 7], 12),
	BitSet([1 3 7], 12)
)
```

`bitAt` is equal to `at`:

```
>>> BitSet([1 3 9], 12)
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
>>> let b = BitSet([1 3 9], 12);
>>> b.clearBitAt(3);
>>> b.positionVector
[1 9]
```

`bitVector` answer a list of `capacity` places indicating the status of each bit:

```
>>> BitSet([0 2 4 5 7 9 11], 12)
>>> .bitVector
[1 0 1 0 1 1 0 1 0 1 0 1]
```

`asString` answers a `String` of `capacity` places with '0' for indices that are 0 and '1' for indices that are 1:

```
>>> BitSet([0 2 4 5 7 9 11], 12)
>>> .asString
'101011010101'

>>> BitSet([0 2 5], 8)
>>> .asString
'10100100'
```

Box notation answers a Unicode string where an empty box,
ordinarily ◻,
represents a zero and a filled box,
ordinarily ◼,
represents a one:

```
>>> BitSet([0 2 5], 8)
>>> .boxNotation(['◻' '◼'])
'◼◻◼◻◻◼◻◻'

>>> BitSet([0 2 4 5 7 9 11], 12)
>>> .boxNotation
'◼◻◼◻◼◼◻◼◻◼◻◼'
```

The `printString` of a `BitSet`:

```
>>> BitSet([0 2 4 5 7 9 11], 12)
>>> .printString
'BitSet([0, 2, 4, 5, 7, 9, 11], 12)'
```

`bitNot` at `BitSet` flips the status of each bit,
in place:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = BitSet(l, 12);
>>> b.bitNot;
>>> b.positionVector
[1 3 6 8 10]
```

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = BitSet(l, 12);
>>> (
>>> 	b.positionVector,
>>> 	b.complement.positionVector
>>> )
(
	[0 2 4 5 7 9 11],
	[1 3 6 8 10]
)
```

* * *

See also: add, asBitSet, at, atPut, bitAt, clearBitAt, includes, remove, ResidueSet, setBitAt

Guides: Bitwise Functions

Unicode: U+25FB ◻ White Medium Square, U+25FC ◼ Black Medium Square

Categories: Collection, Type
