[
	'Navigator/Dom.sl',
	'Navigator/Midi.sl',
	'SmallKansas.sl'
].loadUrlSequence('sk').then { :unusedValue |
	system::smallKansas := SmallKansas()
}
