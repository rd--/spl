# Indexable Syntax

Rewrite rules:

- _c[k]_ ⇒ _at(c, k)_
- _c[k] := v_ ⇒ _put(c, k, v)_

Collection types implement the _at_ and _put_ protocols.

The first rule provides the usual array notation for reading from a collection.

The second rule provides the usual array notation for writing to a collection.

See also [Quoted Indexable Syntax].
