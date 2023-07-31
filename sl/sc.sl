[
	'Music.sl',
	'Sound/Osc.sl',
	'Sound/Sc/Lang.sl',
	'Sound/Sc/Synth.sl',
	'Sound/Sc/Synth/bindings.sl',
	'Sound/Sc/Synth/pseudo.sl'
].loadUrlSequence.then { :unusedValue |
	system::clock := Clock()
}
