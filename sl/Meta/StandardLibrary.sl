[
	(* Collection *)
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
	'Stack' (* Requires: LinkedList *)
	'SortedArray'
	'WeakMap'

	(* Geometry *)
	'Angle'
	'CartesianCoordinate'
	'Length'
	'Matrix22'
	'Matrix33'
	'Point'
	'PolarPoint'
	'Projection3'
	'Rectangle'
	'Vector2'
	'Vector3'
	'Vector4'
	'CylindricalCoordinate' (* Requires: Vector3 *)
	'SphericalCoordinate' (* Requires: Vector3 *)

	(* Graphics *)
	'Colour'

	(* Help *)
	'HelpIndex'

	(* Number *)
	'Complex'
	'Fraction'
	'LargeInteger'

	(* Random *)
	'Mersenne'
	'LinearCongruential'
	'Sfc32'
	'SplitMix'

	(* Stream *)
	'Stream'
	'PositionableStream'
	'WriteStream'
	'CollectionStream'
	'MutableCollectionStream'
	'AsciiStream'
	'Utf8Stream'

	(* System *)
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
	'WebSocket' (* > EventTarget Url *)
	'Window'

	(* Text *)
	'Character'
	'RegExp'

	(* Time *)
	'Clock'
	'Date'
	'Duration'
	'Frequency'
	'TimeStamp'

	(* Unit *)
	'Mass'
	'SiUnit'

	(* Meta *)
	'Categories'

	(* Help *)
	'TerseGuide' (* > Url *)

	(* Sound *)
	'SoundFile' (* > Url *)

].primitiveLoadPackageSequence.then { :unused |
(*
	'../config/preferences.json'.primitiveReadLocalFile.then { :byteArray |
		system.cache::preferences := byteArray.utf8String.parseJson
	}
*)
(*
	let splDirectory = system.environmentVariable('SplDirectory');
	(splDirectory ++ '/config/preferences.json').primitiveReadLocalFile.then { :byteArray |
		system.cache::preferences := byteArray.utf8String.parseJson
	}
*)
(*
	system.fetchJson(
		'https://rohandrape.net/sw/spl/config/preferences.json',
		()
	).then { :answer |
		answer.postLine;
		system.cache::preferences := answer
	}
*)
}
