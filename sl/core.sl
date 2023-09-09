[
	['Kernel-Traits', [
		'Kernel/SystemCache.sl'
		'Kernel/Binary.sl' (* > SystemCache *)
		'Kernel/Integral.sl' (* > SystemCache *)
		'Kernel/Json.sl'
		'Kernel/Magnitude.sl'
		'Kernel/Number.sl'
		'Kernel/Object.sl'
		'Kernel/Random.sl' (* > Object *)
	]],
	['Kernel-Collection-Traits', [
		'Kernel/ArrayedCollection.sl'
		'Kernel/Collection.sl'
		'Kernel/Dictionary.sl'
		'Kernel/Indexable.sl'
		'Kernel/Iterable.sl'
		'Kernel/OrderedCollection.sl'
		'Kernel/SequenceableCollection.sl'
		'Kernel/UnorderedCollection.sl'
	]],
	['Kernel-Types', [
		'Kernel/Boolean.sl'
		'Kernel/Error.sl'
		'Kernel/Nil.sl'
		'Kernel/Package.sl'
		'Kernel/Procedure.sl'
		'Kernel/SmallFloat.sl'
		'Kernel/String.sl'
		'Kernel/System.sl'
	]],
	['Kernel-Collection-Types', [
		'Kernel/Array.sl'
		'Kernel/Record.sl'
	]]
].loadPackageSequence
