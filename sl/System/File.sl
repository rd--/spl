/* Requires: Blob ByteArray Float64Array Sequence */

File! : [Object, Blob] {

	lastModified { :self |
		<primitive: return _self.lastModified;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

}

+@Sequence {

	File { :fileBits :fileName :options |
		<primitive: return new File(_fileBits, _fileName, _options);>
	}

}

+[Blob, ByteArray, Float64Array] {

	File { :self :fileName :options |
		File([self], fileName, options)
	}

}
