loadSequence([
	'lib/sc/lang/Clock.sl',
	'lib/sc/lang/ArrayedCollection.ext.sl',
	'lib/sc/lang/Array.ext.sl',
	'lib/sc/lang/Collection.ext.sl',
	'lib/sc/lang/Interval.ext.sl',
	'lib/sc/lang/Number.ext.sl',
	'lib/sc/lang/Numeric.ext.sl',
	'lib/sc/lang/Object.ext.sl',
	'lib/sc/lang/SequenceableCollection.ext.sl',
	'lib/sc/synth/CcEvent.sl',
	'lib/sc/synth/Scsynth.sl',
	'lib/sc/synth/Ugen.sl',
	'lib/sc/synth/Env.sl', (* requires Ugen *)
	'lib/sc/synth/bindings.sl',
	'lib/sc/synth/bindings-ext.sl',
	'lib/sc/synth/buffer.sl',
	'lib/sc/synth/keyword.sl',
	'lib/sc/synth/operators.sl',
	'lib/sc/synth/pseudo.sl',
	'lib/sc/synth/texture.sl'
]).then { :unusedValue |
	system::clock := Clock()
}
