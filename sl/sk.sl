loadSequence([
	'Graphics.sl',
	'Navigator/Dom.sl',
	'Navigator/Midi.sl',
	'SmallKansas.sl'
]).then { :unusedValue |
	workspace::smallKansas := SmallKansas()
}
