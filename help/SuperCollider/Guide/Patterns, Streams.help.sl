# Patterns, Streams

- Lonce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

	Lonce(1).upToEnd = [1]
	Lonce(Lseries(1, 1, 3)).upToEnd = [1 2 3]

- Lforever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

	Lforever(1).next(9) = [1 1 1 1 1 1 1 1 1]
	Lforever(Lseries(1, 1, 3)).next(9) = [1 2 3 1 2 3 1 2 3]

- Lconstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

	Lconstant(1).next(3) = [1 1 1]
	Lconstant(Lseries(1, 1, 3)).upToEnd = [1 2 3]

- _Lseries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

	Lseries(1, 1, 9).upToEnd = [1 .. 9]

- _Lgeom(start, grow, length)_

Geometric series from _start_, incrementing by _grow_, for _length_ places.

	Lgeom(1, 2, 9).upToEnd = [1 2 4 8 16 32 64 128 256]

- _Lrand(aCollection)_
- _Lrand(aCollection, anInteger)_ ⟹ Lrand(aCollection).take(anInteger)

Select elements from _aCollection_ at random.

	Lrand([1 3 5 7 9], 99).upToEnd.asSet = [1 3 5 7 9].asSet

- _Lcollect(aStream, aBlock:/1)_

Answer a stream that applies _aBlock_ at each element of _aStream_.

	Lseries(1, 1, 5).collect { :each | each * each }.upToEnd = [1 4 9 16 25]

- _Lselect(aStream, aBlock:/1)_

Answer a stream that skips over items from _aStream_ that do not answer true for the predicate _aBlock_.

	Lseries(1, 1, 9).select(even:/1).upToEnd = [2 4 6 8]
