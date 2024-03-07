{- Requires: Object -}

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
		<primitive: return _self.size;> {- Read only -}
	}

	text { :self |
		<primitive: return _self.text();>
	}

	type { :self |
		<primitive: return _self.type;> {- Read only -}
	}

}

Blob! : [Object, Blob] {

}

+List {

	asBlob { :self |
		<primitive: return new Blob(_self);>
	}

	asBlob { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+[ByteArray, Float64Array] {

	asBlob { :self |
		[self].asBlob
	}

}
