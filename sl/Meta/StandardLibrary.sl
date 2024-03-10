[
	{- Behaviour -}
	'Piecewise'
	'Prototype'

	{- Collection -}
	'ArrayBuffer'
	'Bag'
	'Bitset'
	'ByteArray'
	'CategoryDictionary'
	'Float32Array'
	'Float64Array'
	'Graph'
	'Heap'
	'LinkedList'
	'PriorityQueue'
	'RunArray'
	'Set'
	'Stack' {- LinkedList -}
	'SortedList'
	'Tree'
	'Tuple' {- List -}
	'WeakMap'

	{- Geometry -}
	'Angle'
	'CartesianCoordinate'
	'Length'
	'PolarCoordinate'
	'RectangularCoordinate'
	'Circle'  {- RectangularCoordinate -}
	'Matrix22' {- RectangularCoordinate -}
	'Matrix33' {- CartesianCoordinate -}
	'Projection3' {- Matrix33 -}
	'Rectangle'  {- RectangularCoordinate -}
	'FourVector' {- RectangularCoordinate CartesianCoordinate -}
	'CylindricalCoordinate' {- CartesianCoordinate -}
	'Sphere' {- CartesianCoordinate -}
	'SphericalCoordinate' {- CartesianCoordinate -}
	'Point' {- RectangularCoordinate CartesianCoordinate -}

	{- Graphics -}
	'Colour'

	{- Help -}
	'HelpIndex'

	{- Number -}
	'Complex'
	'Fraction'
	'Interval'
	'LargeInteger'

	{- Math -}
	'Binomial'
	'Elementwise'
	'Gamma'
	'Matrix'
	'Primes'
	'WindowFunction'

	{- Stream -}
	'Iterator'
	'Stream'
	'PositionableStream'
	'WriteStream'
	'BlockStream'
	'CollectionStream'
	'MutableCollectionStream'
	'AsciiStream'
	'Utf8Stream'

	{- Random -}
	'LinearCongruential'
	'Mersenne'
	'ProbabilityDistribution'
	'Sfc32' {- Stream -}
	'SplitMix'

	{- System -}
	'Blob'
	'Event'
	'EventTarget'
	'File' {- Blob -}
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
	'Url' {- Blob File -}
	'UrlSearchParams'
	'WebSocket' {- EventTarget Url -}
	'Window'
	'Location' {- Url -}
	'Reflection' {- System -}

	{- Text -}
	'Markdown'
	'RegExp'

	{- Time -}
	'Clock'
	'Date'
	'Duration'
	'Frequency'
	'TimeStamp'

	{- Unit -}
	'Mass'
	'SiUnit'

	{- Meta -}
	'Categories'

	{- Help -}
	'DocumentTest'
	'TerseGuide' {- Url -}
	'TerseReference' {- DocumentTest Url -}

	{- Collection -}
	'SoundFile' {- Url -}

	'Apl'

].primitiveLoadPackageSequence.then { :unused |
	'config/preferences.json'.primitiveReadLocalFile.then { :byteList |
		system.cache::preferences := byteList.utf8String.parseJson
	}
}
