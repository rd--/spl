[
	/* System (Initial) */
	'File' /* Blob */
	'Url' /* Blob File */
	'CacheStorage'
	'LibraryItem' /* CacheStorage, Url */

	/* Behaviour */
	'HashFunction'
	'Piecewise'
	'Prototype'

	/* Collection */
	'Array'
	'AssociationList'
	'Box'
	'CategoryDictionary'
	'DirectedEdge'
	'FiniteWord'
	'Graph'
	'Heap'
	'Histogram'
	'HuffmanCoding'
	'LinkedList'
	'MergeSort'
	'Multiset'
	'NumericArray'
	'PatienceSort'
	'PriorityQueue'
	'QuickSort'
	'RunArray'
	'Set'
	'Slice'
	'Sort'
	'Span'
	'SparseArray'
	'Stack' /* LinkedList */
	'SortedList'
	'SortedSet' /* SortedList */
	'Table'
	'TemporalData'
	'TimeSeries'
	'TypedDictionary'
	'Tree'
	'Tuple' /* List */
	'UndirectedEdge'
	'UnsortedSet'
	'WeakMap'
	'WeightedData'
	'BitSet' /* ByteArray */
	'IdentityMultiset' /* Multiset */
	'IdentitySet' /* Set */
	'Matrix' /* NumericArray */
	'ResidueSet' /* BitSet Set */

	/* Exception */
	'Missing'

	/* Number */
	'Complex'
	'EisensteinInteger'
	'Interval'
	'LargeInteger' /* ByteArray */
	'Quaternion'
	'Residue'
	'Fraction' /* LargeInteger */
	'Decimal' /* Fraction */

	/* Protocol */
	'GeoJson'
	'Schema'

	/* Quantity Traits */
	'Frequency'
	'Length'
	'Mass'
	'PlaneAngle'
	'Time'

	/* Quantity Types */
	'Quantity'
	'QuantityArray'
	'SiPrefix'
	'SiUnit'

	/* Logic */
	'SymbolicExpression'

	/* Geometry */
	'Geometry' /* Trait */
	'Arc'
	'Ball'
	'BarycentricCoordinates'
	'BezierCurve'
	'BipolarCoordinates'
	'CartesianCoordinates'
	'Cartography'
	'Circle'
	'Contour'
	'ConvexHull'
	'DelaunayTriangulation'
	'Disk'
	'DoyleSpiral'
	'Ellipse'
	'FractalCurve'
	'GeneralisedCircle'
	'GeodeticCoordinates'
	'GeometryCollection'
	'HalfPlane'
	'Heightmap'
	'HexagonalCoordinates'
	'HexagonalEfficientCoordinates'
	'InfiniteLine'
	'InfinitePlane'
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
	'PolygonWithHoles'
	'Polyhedron' /* PolygonMesh */
	'AxonometricProjection'
	'Rectangle'
	'Simplex'
	'Sphere'
	'StadiumShape'
	'Superellipse'
	'Tetrahedron'
	'CylindricalCoordinates' /* CartesianCoordinates */
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
	'PerspectiveDrawing'
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
	'BivariatePolynomial'
	'Combinatorics'
	'DifferentialEquations'
	'DistanceFunctions'
	'EasingFunctions'
	'Elementwise'
	'FeatureDetection'
	'Fourier'
	'Gamma'
	'GrayCode'
	'HyperbolicFunctions'
	'IntegerSequence'
	'Integrals'
	'Interpolation'
	'IterativeMaps'
	'MatrixFunctions'
	'NumericalFunctions'
	'OnlineEncyclopediaOfIntegerSequences'
	'Optimization'
	'ParametricEquations'
	'Permutations'
	'Primes'
	'Shuffle'
	'SignalProcessing'
	'SpecialFunctions'
	'Statistics'
	'TrigonometricFunctions'
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
	'PoissonDiskSampling'
	'ProbabilityDistribution'
	'RandomFixedSum'
	'RandomProcess'
	'Sfc32' /* Stream */
	'SplitMix'

	/* Random - ProbabilityDistribution */
	'BernoulliDistribution'
	'BetaDistribution'
	'BetaBinomialDistribution'
	'BinomialDistribution'
	'CauchyDistribution'
	'DirichletDistribution'
	'DiscreteUniformDistribution'
	'EmpiricalDistribution'
	'EpanechnikovDistribution'
	'ExponentialDistribution'
	'ExtremeValueDistribution'
	'FRatioDistribution'
	'GammaDistribution'
	'GeometricDistribution'
	'HypergeometricDistribution'
	'InverseGaussianDistribution'
	'LaplaceDistribution'
	'LevyDistribution'
	'LogisticDistribution'
	'LogNormalDistribution'
	'MultinormalDistribution'
	'MultivariateTDistribution'
	'NoncentralBetaDistribution'
	'NoncentralChiSquareDistribution'
	'NormalDistribution'
	'ParetoDistribution'
	'PoissonDistribution'
	'ReciprocalDistribution'
	'SkewNormalDistribution'
	'StableDistribution'
	'StudentTDistribution'
	'TriangularDistribution'
	'UniformDistribution'
	'WeibullDistribution'

	/* Random - RandomProcess */
	'BernoulliProcess'
	'BinomialProcess'
	'BrownianBridgeProcess'
	'ContinuousMarkovProcess'
	'CoxIngersollRossProcess'
	'DiscreteMarkovProcess'
	'FractionalBrownianMotionProcess'
	'FractionalGaussianNoiseProcess'
	'GeometricBrownianMotionProcess'
	'HiddenMarkovProcess'
	'OrnsteinUhlenbeckProcess'
	'PoissonProcess'
	'RandomWalkProcess'
	'TelegraphProcess'
	'WienerProcess'

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
	'RegularExpression'
	'Unicode'

	/* Time */
	'CalendarDuration'
	'Clock'
	'Date'
	'DateAndTime'
	'Duration'
	'TimeStamp'
	'TimeInterval' /* TimeStamp */

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
