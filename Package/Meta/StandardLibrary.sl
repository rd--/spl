[
	/* System (Initial) */
	'File' /* Blob */
	'Url' /* Blob File */
	'CacheStorage'
	'LibraryItem' /* CacheStorage, Url */

	/* Behaviour */
	'Piecewise'
	'Prototype'

	/* Collection */
	'AssociationList'
	'Bag'
	'CategoryDictionary'
	'DirectedEdge'
	'Heap'
	'LinkedList'
	'PriorityQueue'
	'RunArray'
	'Set'
	'Slice'
	'Stack' /* LinkedList */
	'SortedList'
	'TimeSeries'
	'Tree'
	'Tuple' /* List */
	'UndirectedEdge'
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
	'GeometryCollection'
	'InfiniteLine'
	'InfinitePlane'
	'Length'
	'Line'
	'LineSegment'
	'Parallelogram'
	'Perspective'
	'Plane'
	'PolarCoordinates'
	'PlanarCoordinates'
	'Matrix22' /* PlanarCoordinates */
	'Matrix33' /* CartesianCoordinates */
	'Point'
	'PointCloud'
	'Polygon'
	'PolygonMesh'
	'Polyhedron' /* PolygonMesh */
	'AxonometricProjection'
	'Rectangle'
	'FourVector' /* PlanarCoordinates CartesianCoordinates */
	'CylindricalCoordinates' /* CartesianCoordinates */
	'Sphere' /* CartesianCoordinates */
	'SphericalCoordinates' /* CartesianCoordinates */
	'Triangle'

	/* Chemistry */
	'CrystalStructure'

	/* Graphics */
	'Bitmap'
	'Colour'
	'Graymap'
	'Svg'
	'Plot' /* Interval, LineDrawing */
	'Writing'
	'LineDrawing' /* Svg Writing */

	/* Help */
	'HelpIndex' /* LibraryItem */

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
	'Event'
	'EventTarget'
	'FilePath'
	'FileSystem'
	'Headers'
	'Method'
	'MessageEvent'
	'Navigator'
	'ReadableStream'
	'Scheduling'
	'Storage'
	'SubProcess'
	'Trait'
	'Transcript'
	'Type'
	'UrlQueryParameters'
	'WebSocket' /* EventTarget Url */
	'Window'
	'Location' /* Url */
	'Reflection' /* System */

	/* Text */
	'AsciiString'
	'Html'
	'Markdown'
	'QuotedString'
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
	'DocumentationTest'
	'HelpFile' /* Cache */
	'TerseGuide' /* Url */
	'TerseReference' /* DocumentationTest Url */

	/* Collection */
	'SoundFile' /* Url */

	'Apl'

].primitiveLoadPackageSequence.then { :unused |
	'config/preferences.json'.primitiveReadLocalBinaryFile
}.then { :byteArray |
	system.cache['preferences'] := byteArray.utf8String.parseJson
}
