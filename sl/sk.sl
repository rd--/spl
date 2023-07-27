[
	'Navigator/Dom.sl',
	'Navigator/Midi.sl',
	'SmallKansas.sl'
].loadUrlSequence.then { :unusedValue |
	workspace::smallKansas := SmallKansas()
}
