# CrystalLatticeStructure

A `CrystalLatticeStructure` is a `Type`.

The structure consists of the fields `name`, `description`, `atoms` and `bonds`.
An _atom_ has the form _(symbol, (x, y, z))_.
A _bond_ has the form _(i, j)_, where _i_ and _j_ are indices into the `List` of atoms.

`clsLeitner` is a collection of crystal lattice structures by Michael Leitner at Universität Wien.

~~~
system.clsLeitner.then { :clsLeitner |
	let cls = clsLeitner.atRandom;
	(
		cls.name,
		cls.description.trim,
		cls.atoms,
		cls.bonds
	).postLine
}
~~~

* * *

See also: asCrystalLatticeStructure, CrystalLatticeStructureBrowser

Categories: Chemistry
