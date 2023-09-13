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

	mimeType { :self :mimeType |
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
		]) { :unused |
			self.error('mimeType: unknown mimeType: ' ++ mimeType)
		}
	}

	json { :self |
		<primitive: return _self.json();>
	}

	text { :self |
		<primitive: return _self.text();>
	}

}
