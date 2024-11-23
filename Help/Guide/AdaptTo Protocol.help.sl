# AdaptTo Protocol

The _adapt to_ family of protocols implement multiple polymorphism.

The type dispatch inherent in message lookup reduces a polymorphic variable to a monomorphic one
(Ingalls 1986, p. 348).
Methods are, by definition, type-specialised on the type of the first parameter.
If a method is independently polymorphic on a second parameter,
a second message may be sent to select on the second type.

By informing the second parameter of the type of the first,
and of the operation initially requested,
the second dispatch can be achieved through a small and modular set of messages.
This approach works well with methods that call a primitive that answers immediately if the second type is compatible,
or continues if it is not.

For instance,
when evaluating _p + q_ the system selects the appropriate `+` given the type of _p_.
If _q_ is of the same type as _p_ the method will perform the addition,
else it will inform _q_ of its type,
and that an addition was requested,
by sending the type specific form of the message _q.adaptToAndApply(p, +)_.

- `adaptToCollectionAndApply`
- `adaptToNumberAndApply`

Methods for specific numeric types.

- `adaptToDecimalAndApply`
- `adaptToComplexAndApply`
- `adaptToFractionAndApply`
- `adaptToIntegerAndApply`
- `adaptToIntervalAndApply`
- `adaptToResidueAndApply`

* * *

See also: adaptToCollectionAndApply, adaptToNumberAndApply

Further Reading: Ingalls 1986
