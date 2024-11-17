[
	/* Behaviour */
	'Piecewise'
	'Prototype'

	/* Collection */
	'ArrayBuffer'
	'AssociationList'
	'Bag'
	'BitSet'
	'ByteArray'
	'CategoryDictionary'
	'Float32Array'
	'Float64Array'
	'Heap'
	'LinkedList'
	'PriorityQueue'
	'ResidueSet'
	'RunArray'
	'Set'
	'Slice'
	'Stack' /* LinkedList */
	'SortedList'
	'Tree'
	'Tuple' /* List */
	'WeakMap'
	'Graph' /* Tuple */

	/* Number */
	'Complex'
	'Fraction'
	'Interval'
	'LargeInteger' /* ByteArray */
	'Residue'
	'Decimal' /* Fraction */

	/* Geometry */
	'Angle'
	'CartesianCoordinates'
	'Circle'
	'Length'
	'Plane'
	'PolarCoordinates'
	'PlanarCoordinates'
	'Matrix22' /* PlanarCoordinates */
	'Matrix33' /* CartesianCoordinates */
	'Projection3' /* Matrix33 */
	'Rectangle'
	'FourVector' /* PlanarCoordinates CartesianCoordinates */
	'CylindricalCoordinates' /* CartesianCoordinates */
	'Sphere' /* CartesianCoordinates */
	'SphericalCoordinates' /* CartesianCoordinates */
	'Point' /* PlanarCoordinates CartesianCoordinates */

	/* Graphics */
	'Colour'
	'Plot' /* Interval */

	/* Help */
	'HelpIndex'

	/* Math */
	'Bessel'
	'Binomial'
	'Elementwise'
	'Fourier'
	'Gamma'
	'Matrix'
	'Permutations'
	'Primes'
	'WindowFunction'

	/* Stream */
	'Iterator'
	'Stream'
	'PositionableStream'
	'WriteStream'
	'BlockStream'
	'CollectionStream'
	'MutableCollectionStream'
	'AsciiStream'
	'Utf8Stream'

	/* Random */
	'AliasMethod'
	'LinearCongruential'
	'MersenneTwister'
	'ProbabilityDistribution'
	'Sfc32' /* Stream */
	'SplitMix'

	/* System */
	'Blob'
	'Event'
	'EventTarget'
	'File' /* Blob */
	'FileSystem'
	'Headers'
	'LibraryItem'
	'Method'
	'MessageEvent'
	'Navigator'
	'Scheduling'
	'Storage'
	'SubProcess'
	'Trait'
	'Transcript'
	'Type'
	'Url' /* Blob File */
	'UrlQueryParameters'
	'WebSocket' /* EventTarget Url */
	'Window'
	'Location' /* Url */
	'Reflection' /* System */

	/* Text */
	'AsciiString'
	'Markdown'
	'RegExp'
	'Unicode'

	/* Time */
	'Clock'
	'Date'
	'Duration'
	'Frequency'
	'TimeStamp'

	/* Unit */
	'Mass'
	'SiUnit'

	/* Meta */
	'Categories'

	/* Help */
	'DocumentTest'
	'HelpFile' /* Cache */
	'TerseGuide' /* Url */
	'TerseReference' /* DocumentTest Url */

	/* Collection */
	'SoundFile' /* Url */

	'Apl'

].primitiveLoadPackageSequence.then { :unused |
	'config/preferences.json'.primitiveReadLocalBinaryFile
}.then { :byteArray |
	system.cache::preferences := byteArray.utf8String.parseJson
}
