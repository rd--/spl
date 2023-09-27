# What is a Protocol

In _Smalltalk-80: The Language and its Implementation_ the description of the system is given in terms of _protocols_.

> A protocol description lists the messages understood by instances of a particular class.
> Each message is listed with a comment about its functionality.
> The comment describes the operation that will be performed when the message is received and what value will be returned.
> The comment describes what will happen, not how the operation will be performed.
> (Goldberg & Robson, p.41)

Protocols define messages that can be understood by different types.
The description of the message belongs to the protocol, not the implementation.

Protocols help make the system coherent.


Protocols are related to traits.
Traits collect larger groups of behaviour around a small set of underlying protocols.
For instance, the _Iterable_ trait collects behaviours that can be derived given an implementation of the _do_ protocol.

* * *

See also: Trait, [What is a Trait]
