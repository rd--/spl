/* Requires: Object */

@BinaryLargeObject {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
	}

	isBinaryLargeObject { :unused |
		true
	}

	isEmpty { :self |
		self.size = 0
	}

	slice { :self :start :end :contentType |
		<primitive: return _self.slice(_start, _end, _contentType);>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	text { :self |
		<primitive: return _self.text();>
	}

	type { :self |
		<primitive: return _self.type;>
	}

}

+@Object {

	isBinaryLargeObject { :unused |
		false
	}

}

BinaryLargeObject! : [Object, Equatable, BinaryLargeObject] {

}

+List {

	BinaryLargeObject { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+[ByteArray, Float64Array] {

	asBinaryLargeObject { :self :options |
		BinaryLargeObject([self], options)
	}

	asBinaryLargeObject { :self |
		BinaryLargeObject([self], (:))
	}

}
