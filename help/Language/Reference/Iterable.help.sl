# Iterable -- trait

_Iterable_ is a collection trait.

To implement Iterable a type must provide _do_.

Iterable defines _size_ in terms of _do_, but for many types a more efficient form is possible.

	system.traitTypes('Iterable').includes('Array') = true
	system.traitDictionary::Iterable.isTrait = true

* * *

See also: do, size
