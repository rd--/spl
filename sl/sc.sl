loadSequence([
	'sc/Clock.sl',
	'sc/Env.sl',
	'sc/Scsynth.sl',
	'sc/Ugen.sl',
	'sc/alias.sl',
	'sc/array.sl',
	'sc/bindings.sl',
	'sc/bindings-ext.sl',
	'sc/keyword.sl',
	'sc/math.sl',
	'sc/operators.sl',
	'sc/process.sl',
	'sc/pseudo.sl',
	'sc/texture.sl'
]).then {
	system::clock := Clock()
}
