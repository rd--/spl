Response! : [Object] {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
	}

	asMimeType { :self :mimeType :onError |
		mimeType.caseOfOtherwise([
			'application/json' -> {
				self.json
			},
			'application/octet-stream' -> {
				self.byteArray
			},
			'text/plain' -> {
				self.text
			}
		]) {
			onError.cull(
				Error('Response>>asMimeType: unknown mimeType: ' ++ mimeType)
			)
		}
	}

	asMimeType { :self :mimeType |
		self.asMimeType(mimeType) { :err |
			self.error(err)
		}
	}

	blob { :self |
		<primitive: return _self.blob();>
	}

	byteArray { :self |
		<primitive:
		return _self.arrayBuffer().then(function(b) {
			return new Uint8Array(b);
		});
		>
	}

	headers { :self |
		<primitive: return _self.headers;>
	}

	json { :self |
		<primitive: return _self.json();>
	}

	ok { :self |
		<primitive: return _self.ok;>
	}

	pseudoSlotNameList { :self |
		['ok']
	}

	text { :self |
		<primitive: return _self.text();>
	}

}

+[ArrayBuffer, Blob, ByteArray, Float32Array, Float64Array, String] {

	Response { :self |
		<primitive: return new Response(_self);>
	}

}
