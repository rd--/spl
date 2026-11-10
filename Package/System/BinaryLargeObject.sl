/* Requires: Object */

@BinaryLargeObject {

	arrayBuffer { :self |
		<primitive:
		return _self.arrayBuffer();
		>
	}

	isBinaryLargeObject { :unused |
		true
	}

	isEmpty { :self |
		self.size = 0
	}

	size { :self |
		<primitive:
		return sl.toInteger(_self.size);
		>
	}

	slice { :self :start :end :contentType |
		<primitive:
		return _self.slice(
			sl.toFloat(_start),
			sl.toFloat(_end),
			_contentType
		);
		>
	}

	text { :self |
		<primitive:
		return _self.text();
		>
	}

	type { :self |
		<primitive:
		return _self.type;
		>
	}

}

+@Object {

	isBinaryLargeObject { :unused |
		false
	}

}

BinaryLargeObject! : [Object, Equal, BinaryLargeObject] {

}

+List {

	BinaryLargeObject { :self :options |
		<primitive:
		return new Blob(_self, _options);
		>
	}

}

+[ByteArray, Float64Array] {

	BinaryLargeObject { :self :options |
		BinaryLargeObject([self], options)
	}

	BinaryLargeObject { :self |
		BinaryLargeObject([self], Record())
	}

}
