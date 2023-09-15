[
	['Kernel-Trait', [
		'Kernel/Trait/Cache.sl'
		'Kernel/Trait/Binary.sl' (* > Cache *)
		'Kernel/Trait/Integer.sl' (* > Cache *)
		'Kernel/Trait/Json.sl'
		'Kernel/Trait/Magnitude.sl'
		'Kernel/Trait/Number.sl'
		'Kernel/Trait/Object.sl'
		'Kernel/Trait/Random.sl' (* > Object *)
	]],
	['Kernel-Collection-Trait', [
		'Kernel/Trait/ArrayedCollection.sl'
		'Kernel/Trait/Collection.sl'
		'Kernel/Trait/Dictionary.sl'
		'Kernel/Trait/Indexable.sl'
		'Kernel/Trait/Iterable.sl'
		'Kernel/Trait/OrderedCollection.sl'
		'Kernel/Trait/SequenceableCollection.sl'
		'Kernel/Trait/UnorderedCollection.sl'
	]],
	['Kernel-Type', [
		'Kernel/Behaviour/Procedure.sl'
		'Kernel/Exception/Error.sl'
		'Kernel/Logic/Boolean.sl'
		'Kernel/Nil.sl'
		'Kernel/Number/SmallFloat.sl'
		'Kernel/Scheduling/Promise.sl'
		'Kernel/System/Meta.sl'
		'Kernel/System/Package.sl'
		'Kernel/System/System.sl'
		'Kernel/Text/String.sl'
	]],
	['Kernel-Collection-Type', [
		'Kernel/Collection/Array.sl'
		'Kernel/Collection/Record.sl'
	]]
].loadPackageSequence
