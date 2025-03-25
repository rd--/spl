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
	'Array'
	'Bag'
	'Box'
	'CategoryDictionary'
	'DirectedEdge'
	'Graph'
	'Heap'
	'LinkedList'
	'NumericArray'
	'PriorityQueue'
	'RunArray'
	'Set'
	'Slice'
	'SparseArray'
	'Stack' /* LinkedList */
	'SortedList'
	'TemporalData'
	'TimeSeries'
	'Tree'
	'Tuple' /* List */
	'UndirectedEdge'
	'WeakMap'
	'BitSet' /* ByteArray */
	'Matrix' /* NumericArray */
	'ResidueSet' /* BitSet Set */

	/* Exception */
	'Missing'

	/* Number */
	'Complex'
	'Interval'
	'LargeInteger' /* ByteArray */
	'Residue'
	'Fraction' /* LargeInteger */
	'Decimal' /* Fraction */

	/* Logic */
	'SymbolicExpression'

	/* Geometry */
	'Angle'
	'BezierCurve'
	'CartesianCoordinates'
	'Circle'
	'DelaunayTriangulation'
	'GeometryCollection'
	'HalfPlane'
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
	'ColourGradient'
	'ColourPalette'
	'Graymap'
	'Image'
	'Svg'
	'Plot' /* Interval, LineDrawing */
	'Writing'
	'LineDrawing' /* Svg Writing */

	/* Help */
	'HelpIndex' /* LibraryItem */

	/* Math */
	'ApproximateMathFunctions'
	'Bessel'
	'Binomial'
	'DifferentialEquations'
	'EasingFunctions'
	'Elementwise'
	'Fourier'
	'Gamma'
	'Interpolation'
	'IterativeMaps'
	'MatrixFunctions'
	'Permutations'
	'Primes'
	'UnivariatePolynomial'
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
	'RandomProcess'
	'Sfc32' /* Stream */
	'SplitMix'

	/* Random - ProbabilityDistribution */
	'BernoulliDistribution'
	'BetaDistribution'
	'BinomialDistribution'
	'CauchyDistribution'
	'EmpiricalDistribution'
	'ExponentialDistribution'
	'ExtremeValueDistribution'
	'GammaDistribution'
	'GeometricDistribution'
	'HypergeometricDistribution'
	'LaplaceDistribution'
	'LogisticDistribution'
	'LogNormalDistribution'
	'NoncentralBetaDistribution'
	'NoncentralChiSquareDistribution'
	'NormalDistribution'
	'ParetoDistribution'
	'PoissonDistribution'
	'StudentTDistribution'
	'TriangularDistribution'
	'UniformDistribution'
	'WeibullDistribution'

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

].primitiveLoadPackageSequence.thenElse { :unused |
	'config/preferences.json'.primitiveReadLocalBinaryFile
} { :reason |
	system.error('Failed to load package sequence?: ' ++ reason)
}.thenElse { :byteArray |
	system.cache['preferences'] := byteArray.utf8String.parseJson
} { :reason |
	system.error('Failed to load preferences?: ' ++ reason)
}
