/* Requires: Blob File */

@Url {

	asString { :self |
		self.href
	}

	asUrl { :self |
		self.typeReponsibility('asUrl')
	}

	fileName { :self |
		self.pathName.splitBy('/').last
	}

	fileNameWithoutExtensions { :self |
		self.fileName.splitBy('.').first
	}

	fragment { :self |
		<primitive: return _self.hash;>
	}

	host { :self |
		<primitive: return _self.host;>
	}

	hostName { :self |
		<primitive: return _self.hostname;>
	}

	href { :self |
		<primitive: return _self.href;>
	}

	isUrl { :self |
		true
	}

	origin { :self |
		<primitive: return _self.origin;>
	}

	pathName { :self |
		<primitive: return _self.pathname;>
	}

	port { :self |
		<primitive: return _self.port;>
	}

	protocol { :self |
		<primitive: return _self.protocol;>
	}

	query { :self |
		<primitive: return _self.search;>
	}

	storeString { :self |
		self.href.storeString ++ '.asUrl'
	}

}

URL! : [Object, Url] {

	asUrl { :self |
		self
	}

	password { :self |
		<primitive: return _self.password;>
	}

	queryParameters { :self |
		<primitive: return _self.searchParams;>
	}

	userName { :self |
		<primitive: return _self.username;>
	}

}

+@Object {

	isUrl { :self |
		false
	}

}

+String {

	asFileUrl { :self |
		('file://' ++ self).asUrl
	}

	asUrl { :self |
		<primitive: return new URL(_self);>
	}

	asUrl { :self :base |
		<primitive: return new URL(_self, _base);>
	}

	decodeUri { :self |
		<primitive: return decodeURI(_self);>
	}

	decodeUriComponent { :self |
		<primitive: return decodeURIComponent(_self);>
	}

	encodeUri { :self |
		<primitive: return encodeURI(_self);>
	}

	encodeUriComponent { :self |
		<primitive: return encodeURIComponent(_self);>
	}

	revokeObjectUrl { :self |
		<primitive: return URL.revokeObjectURL(_self);>
	}

}

+[File, Blob] {

	createObjectUrl { :self |
		<primitive: return URL.createObjectURL(_self);>
	}

}

+[URL, String] {

	fetch { :self |
		<primitive: return fetch(_self);>
	}

	fetchBlob { :self |
		self.fetchThen(blob:/1)
	}

	fetchByteArray { :self |
		self.fetchThen(byteArray:/1)
	}

	fetchJson { :self |
		self.fetchThen(json:/1)
	}

	fetchMimeType { :self :mimeType |
		self.fetchThen { :response |
			response.asMimeType(mimeType)
		}
	}

	fetchText { :self |
		self.fetchThen(text:/1)
	}

	fetchTextWithDefault { :self :defaultText |
		self.fetchThenElse(text:/1) { :unused |
			defaultText
		}
	}

	fetchThen { :self :onSuccess:/1 |
		self.fetchThenElse(onSuccess:/1) { :errorCode |
			self.error('Url>>fetchThen: ' ++ errorCode)
		}
	}

	fetchThenElse { :self :onSuccess:/1 :onError |
		self.fetch.thenElse { :response |
			response.ok.if {
				onSuccess(response)
			} {
				onError.cull(response.ok)
			}
		} { :reason |
			onError.cull(reason)
		}
	}

}
