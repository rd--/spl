[
	/* Behaviour */
	'Piecewise'
	'Prototype'

	/* Collection */
	'ArrayBuffer'
	'AssociationList'
	'Bag'
	'ByteArray'
	'CategoryDictionary'
	'Float32Array'
	'Float64Array'
	'Heap'
	'LinkedList'
	'PriorityQueue'
	'RunArray'
	'Set'
	'Slice'
	'Stack' /* LinkedList */
	'SortedList'
	'Tree'
	'Tuple' /* List */
	'WeakMap'
	'BitSet' /* ByteArray */
	'Graph' /* Tuple */
	'ResidueSet' /* BitSet Set */

	/* Number */
	'Complex'
	'Fraction'
	'Interval'
	'LargeInteger' /* ByteArray */
	'Residue'
	'Decimal' /* Fraction */

	/* Geometry */
	'Angle'
	'BezierCurve'
	'CartesianCoordinates'
	'Circle'
	'Length'
	'Line'
	'Plane'
	'PolarCoordinates'
	'PlanarCoordinates'
	'Matrix22' /* PlanarCoordinates */
	'Matrix33' /* CartesianCoordinates */
	'Polygon'
	'Projection3' /* Matrix33 */
	'Rectangle'
	'FourVector' /* PlanarCoordinates CartesianCoordinates */
	'CylindricalCoordinates' /* CartesianCoordinates */
	'Sphere' /* CartesianCoordinates */
	'SphericalCoordinates' /* CartesianCoordinates */
	'Triangle'
	'Point' /* PlanarCoordinates CartesianCoordinates */

	/* Graphics */
	'Colour'
	'Svg'
	'LineDrawing' /* Svg */
	'Plot' /* Interval, LineDrawing */

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
	'FilePath'
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
	'QuotedString'
	'RegExp'
	'Unicode'
	'Writing'

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
	'DocumentationTest'
	'HelpFile' /* Cache */
	'TerseGuide' /* Url */
	'TerseReference' /* DocumentationTest Url */

	/* Collection */
	'SoundFile' /* Url */

	/* Chemistry */
	'CrystalLatticeStructure'

	'Apl'

].primitiveLoadPackageSequence.then { :unused |
	'config/preferences.json'.primitiveReadLocalBinaryFile
}.then { :byteArray |
	system.cache['preferences'] := byteArray.utf8String.parseJson
}
