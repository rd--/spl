/* Meta: StandardLibrary */

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
	'Thunk'

	/* Collection */
	'Array'
	'AssociationList'
	'BitSet'
	'Box'
	'CategoryDictionary'
	'CopySequence'
	'DirectedEdge'
	'EqualityDictionary'
	'FiniteWord'
	'Graph'
	'Heap'
	'Histogram'
	'HuffmanCoding'
	'IdentitySet'
	'Link'
	'LinkedList'
	'ListView'
	'MemoizationTable'
	'MergeSort'
	'Multiset'
	'NumericArray'
	'PatienceSort'
	'PriorityQueue'
	'QuickSort'
	'RelativeRange'
	'ResidueSet' /* BitSet */
	'RunArray'
	'SequenceAlignment'
	'Sort'
	'SortedSet'
	'SparseArray'
	'SortedList'
	'Stack'
	'Table'
	'TemporalData'
	'TimeSeries'
	'Tuple'
	'TypedDictionary'
	'Tree'
	'UndirectedEdge'
	'UnsortedSet'
	'WeightedData'

	/* Collection (Requiring out of order non-Kernel types) */
	'Matrix' /* NumericArray */

	/* Exception */
	'Missing'

	/* Number */
	'Complex'
	'EisensteinInteger'
	'ImplicitFloat'
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
	'WeavingInformationFile'

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
	'NaturalColourSystem'
	'PerspectiveDrawing'
	'Svg'
	'Plot' /* Interval, LineDrawing */
	'PlotSet'
	'Writing'
	'LineDrawing' /* Svg Writing */

	/* Help */
	'HelpIndex' /* LibraryItem */
	'HelpProgram'

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
	'FiniteAutomata'
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
	'ModularArithmetic'
	'Nim'
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
	'BlockStream'
	'CollectionStream'

	/* Random */
	'AliasMethod'
	'LaggedFibonacci'
	'LinearCongruential'
	'MersenneTwister'
	'PoissonDiskSampling'
	'RandomFixedSum'
	'Sfc32' /* Stream */
	'SplitMix'

	/* Random - ProbabilityDistribution */
	'ProbabilityDistribution' /* Trait */
	'ArcSinDistribution'
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
	'HyperbolicDistribution'
	'HypergeometricDistribution'
	'InverseGaussianDistribution'
	'LaplaceDistribution'
	'LevyDistribution'
	'LogisticDistribution'
	'LogNormalDistribution'
	'MeixnerDistribution'
	'MultinormalDistribution'
	'MultivariateTDistribution'
	'NoncentralBetaDistribution'
	'NoncentralChiSquareDistribution'
	'NormalDistribution'
	'ParetoDistribution'
	'PoissonDistribution'
	'ReciprocalDistribution'
	'SechDistribution'
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
	system.error('Failed to load package sequence?: ', [reason])
}.thenElse { :byteArray |
	system.cache['preferences'] := byteArray.utf8String.parseJson
} { :reason |
	system.error('Failed to load preferences?', [reason])
}
