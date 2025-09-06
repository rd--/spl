# Dictionary

- _Dictionary([k₁ -> v₁, k₂ -> v₂, …])_

`Dictionary` is a `Trait` holding behaviours common to collections of associations,
and also a `Type` representing a dictionary where keys are compared according to `=`,
the equality operator.

Dictionaries are homogenous sets of key and value pairs,
called associations,
with the property that each key occurs at most once.

The uniqueness of keys is determined using a `comparator`,
for `Map` and `Record` it is `==`,
for `Dictionary` it is `=`.

Dictionaries are indexed using the unique `key` to obtain the corresponding `value`.

The required methods are:

- `atIfAbsent`
- `atPut`
- `keysAndValuesDo`
- `size`

The `Dictionary` type is less efficient than both `Map`,
the identity dictionary type,
and `Record`,
the string dictionary type.

There is a literal syntax for `Dictionary`:

```
>>> let d = [|1 -> 'x', 2 -> 'y'|];
>>> (d.keys, d.values)
([1 2], ['x' 'y'])
```

The empty `Dictionary`:

```
>>> let d = [| |];
>>> (d.size, d.isEmpty, d.comparator)
(0, true, =)
```

A `Dictionary` with lists for keys:

```
>>> let d = [|
>>> 	[1 2] -> 3,
>>> 	[4 5] -> 6
>>> |];
>>> (
>>> 	d.keys,
>>> 	d.keys.collect { :each | d[each] },
>>> 	d.values
>>> )
([1 2; 4 5], [3 6], [3 6])
```

Construct a dictionary with a specified comparator:

```
>>> let d = Dictionary();
>>> d.comparator := ~;
>>> d[0] := 1;
>>> d[1E-9] := 2;
>>> d[-1E-9] := 3;
>>> (d.size, d.associations)
(1, [0 -> 3])
```

Dictionary is a trait:

```
>>> system
>>> .traitDictionary['Dictionary']
>>> .isTrait
true
```

Map implements Dictionary:

```
>>> system
>>> .traitTypes('Dictionary')
>>> .includes('Map')
true
```

Methods for accessing: at, atIfAbsent, associationAt, associationAtIfAbsent, keyAtValue, keyAtValueIfAbsent, keys, values

Methods for testing: includes, includesKey

Methods for enumerating: do, keysDo, valuesDo, keysAndValuesDo, associationsDo

* * *

See also: Association, Map, Record

Guides: Dictionary Functions, Dictionary Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Association.html),
_W_
[1](https://en.wikipedia.org/wiki/Associative_array)

Categories: Collection, Trait
