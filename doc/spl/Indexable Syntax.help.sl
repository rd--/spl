# Indexable Syntax -- syntax

Rewrite rules:

- _c[k]_ ⟹ _at(c, k)_
- _c[k] := v_ ⟹ _atPut(c, k, v)_
- _c[k] :? a_ ⟹ _atIfAbsent(c, k, a)_
- _c[k] :=? a_ ⟹ _atIfAbsentPut(c, k, a)_

Collection types implement the _at_ and _atPut_ protocols.

The first rule, [At Syntax], provides the usual array notation for reading from a collection.

The second rule, [AtPut Syntax], provides the usual array notation for writing to a collection.

The third rule, [AtIfAbsent Syntax], allows for specifying the answer if the index is absent.

The fourth rule, [AtIfAbsentPut Syntax], allows for specifying the answer if the index is absent, and updating the collection accordingly.

* * *

See also: [At Syntax], [AtIfAbsent Syntax], [AtIfAbsentPut Syntax], [AtPut Syntax], [Quoted Indexable Syntax].
