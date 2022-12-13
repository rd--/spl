# Quoted Indexable Syntax

Rewrite rules:

- _c::k_ ≡ _at(c, 'k')_
- _c::k := v_ ≡ _atPut(c, 'k', v)_

Collection types implement the _at_ and _atPut_ protocols.

Dictionaries with string keys can be used to implement simple anonymous and extensible record types.

The [Dictionary Syntax] makes constucting such records concise.

These rules provide an equally concise syntax for reading and writing the fields of such records.

_Rationale_:
In Smalltalk systems the _doesNotUnderstand_ protocol is sometimes used for a similar purpose.
If a Dictionary object _c_ is sent a message _m_ that it does not understand,
and if _c_ has an entry for _'m'_,
the message is interpreted as a field access message.

* * *

See also: [Indexable Syntax]
