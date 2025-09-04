# Property Syntax

Rewrite rules:

- _r::p_ ⟹ _propertyRead(r, 'p')_
- _r::p := x_ ⟹ _propertyWrite(r, 'p', x)_

`Record Syntax` makes constructing records concise.
`Property Syntax` provides equally concise syntaxes for reading and writing record properties.

_Rationale_:
In Smalltalk systems the _doesNotUnderstand_ protocol is sometimes used for a similar purpose.
If a Dictionary object _c_ is sent a message _m_ that it does not understand,
and if _c_ has an entry for _'m'_,
the message is interpreted as a field access message.

* * *

See also: Indexable Syntax, Property Read Syntax, Property Write Syntax

Categories: Syntax
