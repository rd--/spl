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

	Blob { :self |
		<primitive: return new Blob(_self);>
	}

	Blob { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+[URL, String] {

	fetchBlob { :self :options |
		self.fetchBlob(options) { :errorCode |
			self.error('fetchBlob: ' ++ errorCode)
		}
	}

	fetchBlob { :self :options :onError |
		self.fetch(options).then { :response |
			response.ok.if {
				response.blob
			} {
				onError.cull(response.ok)
			}
		}
	}

}

{- Requires: ByteArray Float64Array -}
{-
	+[ByteArray, Float64Array] {

		asBlob { :self |
			[self].asBlob
		}

	}
-}
