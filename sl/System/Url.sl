{- Requires: Blob File -}

@Url {

	asUrl { :self |
		self.typeReponsibility('asUrl')
	}

}

URL! : [Object, Url] {

	asUrl { :self |
		self
	}

	fetch { :self |
		<primitive: return fetch(_self);>
	}

	fetchText { :self |
		self.fetchText { :errorCode |
			self.error('fetchText: ' ++ errorCode)
		}
	}

	fetchText { :self :onError |
		self.fetch.then { :response |
			response.ok.if {
				response.text
			} {
				onError.cull(response.ok)
			}
		}
	}

	hash { :self |
		<primitive: return _self.hash;>
	}

	host { :self |
		<primitive: return _self.host;>
	}

	hostname { :self |
		<primitive: return _self.hostname;>
	}

	href { :self |
		<primitive: return _self.href;>
	}

	isUrl { :self |
		true
	}

	origin { :self |
		<primitive: return _self.origin;> {- Read only -}
	}

	password { :self |
		<primitive: return _self.password;>
	}

	pathname { :self |
		<primitive: return _self.pathname;>
	}

	port { :self |
		<primitive: return _self.port;>
	}

	protocol { :self |
		<primitive: return _self.protocol;>
	}

	search { :self |
		<primitive: return _self.search;>
	}

	searchParams { :self |
		<primitive: return _self.searchParams;>
	}

	username { :self |
		<primitive: return _self.username;> {- Read only -}
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
		Url(self)
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

	Url { :self |
		<primitive: return new URL(_self);>
	}

	Url { :self :base |
		<primitive: return new URL(_self, _base);>
	}

}

+[File, Blob] {

	createObjectUrl { :self |
		<primitive: return URL.createObjectURL(_self);>
	}

}
