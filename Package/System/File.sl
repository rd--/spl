/* Requires: BinaryLargeObject ByteArray Float64Array Sequence */

File! : [Object, BinaryLargeObject] {

	lastModified { :self |
		<primitive: return _self.lastModified;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

}

+List {

	File { :fileBits :fileName :options |
		<primitive: return new File(_fileBits, _fileName, _options);>
	}

}

+[BinaryLargeObject, ByteArray, Float64Array] {

	File { :self :fileName :options |
		File([self], fileName, options)
	}

}

+[List, BinaryLargeObject, ByteArray, Float64Array] {

	File { :fileBits :fileName |
		File(fileBits, fileName, (:))
	}

}
