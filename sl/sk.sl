[
	Package('Sk', [
		'Navigator/Dom.sl'
		'Navigator/Midi.sl'
		'SmallKansas.sl'
	])
].loadPackages.then { :unusedValue |
	system::smallKansas := SmallKansas()
}
