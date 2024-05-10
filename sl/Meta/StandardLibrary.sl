[
	{- Behaviour -}
	'Piecewise'
	'Prototype'

	{- Collection -}
	'ArrayBuffer'
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
	'Stack' {- LinkedList -}
	'SortedList'
	'Tree'
	'Tuple' {- List -}
	'WeakMap'
	'Graph' {- Tuple -}

	{- Geometry -}
	'Angle'
	'CartesianCoordinates'
	'Length'
	'Plane'
	'PolarCoordinates'
	'RectangularCoordinates'
	'Circle'  {- RectangularCoordinates -}
	'Matrix22' {- RectangularCoordinates -}
	'Matrix33' {- CartesianCoordinates -}
	'Projection3' {- Matrix33 -}
	'Rectangle'  {- RectangularCoordinates -}
	'FourVector' {- RectangularCoordinates CartesianCoordinates -}
	'CylindricalCoordinates' {- CartesianCoordinates -}
	'Sphere' {- CartesianCoordinates -}
	'SphericalCoordinates' {- CartesianCoordinates -}
	'Point' {- RectangularCoordinates CartesianCoordinates -}

	{- Graphics -}
	'Colour'

	{- Help -}
	'HelpIndex'

	{- Number -}
	'Complex'
	'Fraction'
	'Interval'
	'LargeInteger'
	'Residue'
	'Decimal' {- Fraction -}

	{- Math -}
	'Binomial'
	'Elementwise'
	'Gamma'
	'Matrix'
	'Permutations'
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
	'AsciiString'
	'Markdown'
	'RegExp'
	'Unicode'

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
	'HelpFile' {- Cache -}
	'TerseGuide' {- Url -}
	'TerseReference' {- DocumentTest Url -}

	{- Collection -}
	'SoundFile' {- Url -}

	'Apl'

].primitiveLoadPackageSequence.then { :unused |
	'config/preferences.json'.primitiveReadLocalBinaryFile.then { :byteArray |
		system.cache::preferences := byteArray.utf8String.parseJson
	}
}
