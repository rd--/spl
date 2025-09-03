/* Requires: Object */

@Blob {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
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

Blob! : [Object, Blob] {

}

+List {

	Blob { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+[ByteArray, Float64Array] {

	asBlob { :self :options |
		Blob([self], options)
	}

	asBlob { :self |
		Blob([self], (:))
	}

}
