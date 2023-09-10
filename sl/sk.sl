[
	Package('Navigator-Dom'),
	Package('Navigator-Midi'),
	Package('SmallKansas')
].loadPackages.then { :unusedValue |
	system::smallKansas := SmallKansas()
}
