# Indexable Syntax

Rewrite rules:

- _c[k]_ ⟹ _at(c, k)_
- _c[k] := v_ ⟹ _atPut(c, k, v)_

Collection types implement the `at` and `atPut` protocols.

The first rule, `At Syntax`, provides the usual indexing notation for reading from a collection.

The second rule, `AtPut Syntax`, provides the usual indexing notation for writing to a collection.

There are two further experimental syntaxes:

- _c[k] :? a_ ⟹ _atIfAbsent(c, k, a)_
- _c[k] :=? a_ ⟹ _atIfAbsentPut(c, k, a)_

The third rule, `Experimental AtIfAbsent Syntax`, allows for specifying the answer if the index is absent.

The fourth rule, `Experimental AtIfAbsentPut Syntax`, allows for specifying the answer if the index is absent, and updating the collection accordingly.

* * *

See also: At Syntax, AtPut Syntax, Quoted Indexable Syntax

Categories: Syntax
