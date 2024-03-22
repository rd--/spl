# Association

- _Association(key, value)_

An `Association` is a type that connects a _key_ with a _value_.

Instances are ordinarily entries in a `Dictionary` type, i.e. `Map` or `Record`.

A `List` with only `Association` entries is called an _association list_.

The operator form of `Association` is `->`.

Equality considers both _key_ & _value_, unlike in Smalltalk-80.
In a `Dictionary` context there cannot be duplicate keys, hence considering only key for equality.

* * *

See also: ->, associations

Categories: Collection, Type
