/* Requires: BinaryLargeObject File */

@Url {

	Url { :self |
		self.typeResponsibility('Url')
	}

	directory { :self |
		self.pathName.pathDirectory
	}

	fileName { :self |
		self.pathName.splitOn('/').last
	}

	fileNameWithoutExtensions { :self |
		self.fileName.splitOn('.').first
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

}

URL! : [Object, Store, Equal, Url] {

	Url { :self |
		self
	}

	password { :self |
		<primitive: return _self.password;>
	}

	queryParameters { :self |
		<primitive: return _self.searchParams;>
	}

	storeString { :self |
		'Url(%)'.format([self.href.storeString])
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

	Url { :self |
		<primitive: return new URL(_self);>
	}

	Url { :self :base |
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

	fileUrl { :self |
		Url('file://' ++ self)
	}

	revokeObjectUrl { :self |
		<primitive: return URL.revokeObjectURL(_self);>
	}

}

+[File, BinaryLargeObject] {

	createObjectUrl { :self |
		<primitive: return URL.createObjectURL(_self);>
	}

}

+[URL, String] {

	fetch { :self |
		<primitive: return fetch(_self);>
	}

	fetchBinaryLargeObject { :self |
		self.fetchThen(
			binaryLargeObject/1
		)
	}

	fetchByteArray { :self |
		self.fetchThen(
			byteArray/1
		)
	}

	fetchJson { :self |
		self.fetchThen(
			json/1
		)
	}

	fetchMimeType { :self :mimeType |
		self.fetchThen { :response |
			response.asMimeType(mimeType)
		}
	}

	fetchText { :self |
		self.fetchThen(
			text/1
		)
	}

	fetchTextWithDefault { :self :defaultText |
		self.fetchThenElse(text/1) { :unused |
			defaultText
		}
	}

	fetchThen { :self :onSuccess/1 |
		self.fetchThenElse(onSuccess/1) { :errorCode |
			self.error('Url>>fetchThen', [errorCode])
		}
	}

	fetchThenElse { :self :onSuccess/1 :onError |
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

+URL {

	cachedFetch { :self :cacheName |
		system.caches.atIfPresent(cacheName) { :cache |
			cache.atIfAbsent(self) {
				/* ['cachedFetch: absent', self, cacheName].printLine; */
				self.fetch.thenElse { :response |
					cache.put!(self, response).then { :unused |
						cache.uncheckedMatch(self)
					}
				} { :reason |
					self.error('cachedFetch', [reason])
				}
			}
		}
	}

	cachedFetchMimeType { :self :cacheName :mimeType |
		self.cachedFetch(cacheName).thenElse { :response |
			response.asMimeType(mimeType)
		} { :reason |
			self.error('Url>>cachedFetchMimeType', [reason])
		}
	}

}

+String {

	gitHubFileUrl { :userName :projectName :branch :filePath |
		Url(
			'https://raw.githubusercontent.com/%/%/refs/heads/%/%'.format(
				[
					userName,
					projectName,
					branch,
					filePath
				]
			)
		)
	}

	gitLabFileUrl { :userName :projectName :branch :filePath |
		Url(
			'https://gitlab.com/%/%/-/raw/%/%'.format(
				[
					userName,
					projectName,
					branch,
					filePath
				]
			)
		)
	}

}
