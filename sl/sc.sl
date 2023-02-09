loadSequence([
	'Sound/Sc/Lang/Clock.sl',
	'Sound/Sc/Lang/ArrayedCollection.ext.sl',
	'Sound/Sc/Lang/Array.ext.sl',
	'Sound/Sc/Lang/Collection.ext.sl',
	'Sound/Sc/Lang/Interval.ext.sl',
	'Sound/Sc/Lang/Number.ext.sl',
	'Sound/Sc/Lang/Numeric.ext.sl',
	'Sound/Sc/Lang/Object.ext.sl',
	'Sound/Sc/Lang/SequenceableCollection.ext.sl',
	'Sound/Sc/Synth/CcEvent.sl',
	'Sound/Sc/Synth/ScSynth.sl',
	'Sound/Sc/Synth/ScUgen.sl',
	'Sound/Sc/Synth/Ugen.sl',
	'Sound/Sc/Synth/UgenGraph.sl',
	'Sound/Sc/Synth/Env.sl', (* requires Ugen *)
	'Sound/Sc/Synth/bindings.sl',
	'Sound/Sc/Synth/bindings-ext.sl',
	'Sound/Sc/Synth/buffer.sl',
	;; 'Sound/Sc/Synth/keyword.sl',
	'Sound/Sc/Synth/operators.sl',
	'Sound/Sc/Synth/pseudo.sl',
	'Sound/Sc/Synth/texture.sl'
]).then { :unusedValue |
	workspace::clock := Clock()
}
