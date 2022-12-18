loadSequence([
	'sc/lang/Clock.sl',
	'sc/lang/ArrayedCollection.ext.sl',
	'sc/lang/Array.ext.sl',
	'sc/lang/Collection.ext.sl',
	'sc/lang/Number.ext.sl',
	'sc/lang/Numeric.ext.sl',
	'sc/lang/Object.ext.sl',
	'sc/lang/SequenceableCollection.ext.sl',
	'sc/synth/Env.sl',
	'sc/synth/Scsynth.sl',
	'sc/synth/Ugen.sl',
	'sc/synth/bindings.sl',
	'sc/synth/bindings-ext.sl',
	'sc/synth/buffer.sl',
	'sc/synth/keyword.sl',
	'sc/synth/operators.sl',
	'sc/synth/pseudo.sl',
	'sc/synth/texture.sl'
]).then {
	system::clock := Clock()
}
