Response! : [Object] {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
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

	mimeType { :self :mimeType :onError |
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
				Error('Response>>mimeType: unknown mimeType: ' ++ mimeType)
			)
		}
	}

	mimeType { :self :mimeType |
		self.mimeType(mimeType) { :err |
			self.error(err)
		}
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
