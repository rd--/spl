[
	/* System (Initial) */
	'File' /* BinaryLargeObject */
	'Url' /* BinaryLargeObject File */
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
	'CopyableSequence'
	'DirectedEdge'
	'FiniteWord'
	'Graph'
	'Heap'
	'Histogram'
	'HuffmanCoding'
	'LinkedList'
	'ListView'
	'MergeSort'
	'Multiset'
	'NumericArray'
	'PatienceSort'
	'PriorityQueue'
	'QuickSort'
	'RelativeRange'
	'RunArray'
	'SequenceAlignment'
	'Set'
	'Sort'
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
	'Annulus'
	'Arc'
	'Ball'
	'BarycentricCoordinates'
	'BezierCurve'
	'BipolarCoordinates'
	'CartesianCoordinates'
	'Cartography'
	'Circle'
	'Cone'
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
	'Parallelepiped'
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
	'Spiral'
	'StadiumShape'
	'Superellipse'
	'Tetrahedron'
	'CylindricalCoordinates' /* CartesianCoordinates */
	'SphericalCoordinates' /* CartesianCoordinates */
	'Triangle'
	'TurtleGeometry'

	/* Chemistry */
	'CrystalStructure'

	/* Graphics */
	'Bitmap'
	'Colour'
	'ColourGradient'
	'ColourGrid'
	'ColourPalette'
	'Greymap'
	'Image'
	'PerspectiveDrawing'
	'Svg'
	'Plot' /* Interval, LineDrawing */
	'PlotSet'
	'Writing'
	'LineDrawing' /* Svg Writing */

	/* Help */
	'HelpIndex' /* LibraryItem */

	/* Math */
	'ApproximateMathFunctions'
	'Bessel'
	'Binomial'
	'BivariatePolynomial'
	'ChordDiagram'
	'Combinatorics'
	'DifferentialEquations'
	'DistanceFunctions'
	'DyckWord'
	'EasingFunctions'
	'Elementwise'
	'FeatureDetection'
	'FibonacciNumbers'
	'Fourier'
	'Gamma'
	'GrayCode'
	'GroupTheory'
	'HyperbolicFunctions'
	'IntegerPartition'
	'IntegerSequence'
	'Integrals'
	'Interpolation'
	'IterativeMaps'
	'LowDiscrepancySequence'
	'MathematicalConstant'
	'MatrixFunctions'
	'MixedRadix'
	'NumericalFunctions'
	'OnlineEncyclopediaOfIntegerSequences'
	'OptimizationFunctions'
	'ParametricEquations'
	'Permutations'
	'Primes'
	'Shuffle'
	'SignalProcessing'
	'Siteswap'
	'SpecialFunctions'
	'Statistics'
	'TrigonometricFunctions'
	'UnivariatePolynomial'
	'VectorFunctions'
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
	'RandomFixedSum'
	'Sfc32' /* Stream */
	'SplitMix'

	/* Random - ProbabilityDistribution */
	'ProbabilityDistribution' /* Trait */
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
	'RandomProcess' /* Trait */
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
