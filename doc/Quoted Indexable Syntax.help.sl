# Quoted Indexable Syntax

Rewrite rules:

- _c::k_ ⇒ _at(c, 'k')_
- _c::k := v_ ⇒ _put(c, 'k', v)_

Collection types implement the _at_ and _put_ protocols.

Dictionaries with string keys can be used to implement simple anonymous and extensible record types.

The [Dictionary Syntax] makes constucting such records concise.

These rules provide an equally concise syntax for reading and writing the fields of such records.

See also [Indexable Syntax].

_Rationale_:
In Smalltalk systems the _doesNotUnderstand_ protocol is sometimes used for a similar purpose.
If a Dictionary object _c_ is sent a message _m_ that it does not understand,
and if _c_ has an entry for _'m'_,
the message is inptereted as a field access message.
