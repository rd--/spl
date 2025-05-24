Response! : [Object] {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
	}

	asMimeType { :self :mimeType :onError |
		mimeType.caseOf([
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

	body { :self |
		<primitive: return _self.body;>
	}

	bodyUsed { :self |
		<primitive: return _self.bodyUsed;>
	}

	byteArray { :self |
		<primitive:
		return _self.arrayBuffer().then(function(b) {
			return new Uint8Array(b);
		});
		>
	}

	clone { :self |
		<primitive: return _self.clone();>
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

	status { :self |
		<primitive: return _self.status;>
	}

	statusText { :self |
		<primitive: return _self.statusText;>
	}

	text { :self |
		<primitive: return _self.text();>
	}

	type { :self |
		<primitive: return _self.type;>
	}

	url { :self |
		<primitive: return _self.url;>
	}

}

+[ArrayBuffer, Blob, ByteArray, Float32Array, Float64Array, String] {

	Response { :self :options |
		<primitive: return new Response(_self, _options);>
	}

	Response { :self |
		Response(
			self,
			(
				status: 200,
				statusText: '',
				headers: ()
			)
		)
	}

}
