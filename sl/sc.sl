loadSequence([
	'Music.sl',
	'Sound/Osc.sl',
	'Sound/Sc/Lang.sl',
	'Sound/Sc/Synth.sl',
	'Sound/Sc/Synth/bindings.sl',
	'Sound/Sc/Synth/pseudo.sl'
]).then { :unusedValue |
	workspace::clock := Clock()
}
