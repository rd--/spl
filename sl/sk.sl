[
	'Navigator/Dom.sl',
	'Navigator/Midi.sl',
	'SmallKansas.sl'
].loadUrlSequence.then { :unusedValue |
	system::smallKansas := SmallKansas()
}
