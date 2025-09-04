# Indexable Syntax

Rewrite rules:

- _c[i]_ ⟹ _at(c, i)_
- _c[i] := x_ ⟹ _atPut(c, i, x)_

Collection types implement the `at` and `atPut` protocols.

The first rule, `At Syntax`, provides the usual indexing notation for reading from a collection.

```
>> 'c[i]'.splSimplify
at(c, i)
```

The second rule, `AtPut Syntax`, provides the usual indexing notation for writing to a collection.

```
>> 'c[i] := x'.splSimplify
atPut(c, i, x)
```

There are two further experimental syntaxes:

- _c[k] :? a_ ⟹ _atIfAbsent(c, k, a)_
- _c[k] :=? a_ ⟹ _atIfAbsentPut(c, k, a)_

The third rule, `Experimental AtIfAbsent Syntax`, allows for specifying the answer if the index is absent.

The fourth rule, `Experimental AtIfAbsentPut Syntax`, allows for specifying the answer if the index is absent, and updating the collection accordingly.

* * *

See also: At Syntax, AtPut Syntax, Quoted Indexable Syntax

Categories: Syntax
