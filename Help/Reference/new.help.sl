# new

- _new(c, n=0)_

Create a new collection that is like the collection _c_.
In the binary form the answer will have _n_ places,
if it is an appropriate kind of collection,
else it will be empty.
`new` is defined in terms of `species`.
`new` is the mechanism by which functions such as `collect` answer the appropriate type.
The names `new` and `species` are from Smalltalk.

The unary form, for collections where `species` answers a no-argument block:

```
>>> IdentitySet().species
IdentitySet/0

>>> IdentitySet().new
IdentitySet()

>>> LinkedList().species
LinkedList/0

>>> LinkedList().new
LinkedList()
```

The binary form of `new`,
at collections where `species` answers a one-argument block:

```
>>> [].species
nilList/1

>>> [].new(3)
[nil nil nil]

>>> let a = [];
>>> a.new(3) !== a
true
```

The binary form answers a collection of size _n_ only if the `species` of _c_ is unary,
the method `newOfSize` exlpicityly adds items as required:

```
>>> LinkedList().new(3)
LinkedList()

>>> LinkedList().newOfSize(3)
LinkedList[nil nil nil]
```

Sets cannot be made to have the same item multiple times:

```
>>> IdentitySet().new
IdentitySet()

>>> IdentitySet().new(3)
IdentitySet()

>>> {
>>> 	IdentitySet().newOfSize(3)
>>> }.hasError
true
```

At `AsciiString`:

```
>>> AsciiString''.new
AsciiString''

>>> AsciiString''.new(3)
AsciiString(String(ByteArray[0 0 0]))
```

At `ByteArray`:

```
>>> ByteArray[].new
ByteArray[]

>>> ByteArray[].new(3)
ByteArray[0 0 0]
```

At `Float32Array`:

```
>>> Float32Array[1 2 3].new(3)
Float32Array[0 0 0]
```

At `Float64Array`:

```
>>> Float64Array[1 2 3].new(3)
Float64Array[0 0 0]
```

At `Multiset` and `IdentityMultiset`:

```
>>> Multiset().new
Multiset()

>>> Multiset().new(3)
Multiset()

>>> Multiset().newOfSize(3)
Multiset[nil -> 3]

>>> IdentityMultiset().new
IdentityMultiset()

>>> IdentityMultiset().new(3)
IdentityMultiset()

>>> IdentityMultiset().newOfSize(3)
IdentityMultiset[nil -> 3]
```

At `LinkedList`:

```
>>> LinkedList().new
LinkedList()

>>> LinkedList().new(3)
LinkedList()

>>> LinkedList().newOfSize(3)
LinkedList[nil nil nil]
```

At `List`:

```
>>> List().new
List()

>>> List().new(3)
[nil nil nil]
```

At `ListView`:

```
>>> ListView([], 1, 0).new
List()

>>> ListView([], 1, 0).new(3)
[nil nil nil]
```

At `Map`:

```
>>> Map().new
Map()

>>> Map().new(3)
Map()

>>> {
>>> 	Map().newOfSize(3)
>>> }.hasError
true
```

At `Range`:

```
>>> 1:9.new
[]

>>> 1:9.new(3)
[nil nil nil]
```

At `Record`:

```
>>> Record().new
Record()

>>> Record().new(3)
Record()

>>> {
>>> 	Record().newOfSize(3)
>>> }.hasError
true
```

* * *

See also: New, extendToSize!, newFrom, newOfSize, species

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Smalltalk_
5.3.9.1

Categories: Instance Creation, Reflection
