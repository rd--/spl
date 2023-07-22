# Indexable Syntax -- syntax

Rewrite rules:

- _c[k]_ ≡ _at(c, k)_
- _c[k] := v_ ≡ _atPut(c, k, v)_

Collection types implement the _at_ and _atPut_ protocols.

The first rule, [At Syntax], provides the usual array notation for reading from a collection.

The second rule, [AtPut Syntax], provides the usual array notation for writing to a collection.

* * *

See also: [At Syntax], [AtPut Syntax], [Quoted Indexable Syntax].
