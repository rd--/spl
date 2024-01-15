[
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
	'Stack' {- Requires: LinkedList -}
	'SortedArray'
	'Tuple'
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
	'CylindricalCoordinate' {- Requires: CartesianCoordinate -}
	'Sphere' {- Requires: CartesianCoordinate -}
	'SphericalCoordinate' {- Requires: CartesianCoordinate -}
	'Point' {- RectangularCoordinate, CartesianCoordinate -}

	{- Graphics -}
	'Colour'

	{- Help -}
	'HelpIndex'

	{- Number -}
	'Complex'
	'Fraction'
	'LargeInteger'

	{- Stream -}
	'Iterator'
	'Stream'
	'PositionableStream'
	'WriteStream'
	'CollectionStream'
	'MutableCollectionStream'
	'AsciiStream'
	'Utf8Stream'

	{- Random -}
	'Mersenne'
	'LinearCongruential'
	'Sfc32' {- Stream -}
	'SplitMix'

	{- System -}
	'Blob'
	'Event'
	'EventTarget'
	'File'
	'FileSystem'
	'LibraryItem'
	'Method'
	'MessageEvent'
	'Storage'
	'SubProcess'
	'Trait'
	'Transcript'
	'Type'
	'Url'
	'UrlSearchParams'
	'WebSocket' {- > EventTarget Url -}
	'Window'

	{- Text -}
	'Character'
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
	'TerseGuide' {- > Url -}

	{- Sound -}
	'SoundFile' {- > Url -}

].primitiveLoadPackageSequence.then { :unused |
	{-
		'../config/preferences.json'.primitiveReadLocalFile.then { :byteArray |
			system.cache::preferences := byteArray.utf8String.parseJson
		}
	-}
	{-
		let splDirectory = system.environmentVariable('SplDirectory');
		(splDirectory ++ '/config/preferences.json').primitiveReadLocalFile.then { :byteArray |
			system.cache::preferences := byteArray.utf8String.parseJson
		}
	-}
	{-
		system.fetchJson(
			'https://rohandrape.net/sw/spl/config/preferences.json',
			()
		).then { :answer |
			answer.postLine;
			system.cache::preferences := answer
		}
	-}
}
