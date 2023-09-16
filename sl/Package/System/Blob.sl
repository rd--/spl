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
		<primitive: return _self.size;> (* Read only *)
	}

	text { :self |
		<primitive: return _self.text();>
	}

	type { :self |
		<primitive: return _self.type;> (* Read only *)
	}

}

Blob! : [Object, Blob] {

}

+Array {

	Blob { :self |
		<primitive: return new Blob(_self);>
	}

	Blob { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+System {

	fetchBlob { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.blob
		}
	}

}

(* {"requires": ["ByteArray", "Float64Array"]} *)
(*
+[ByteArray, Float64Array] {

	Blob { :self |
		[self].Blob
	}

}
*)
