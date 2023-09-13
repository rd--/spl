Window! : [Object] {

	alert { :self :aString |
		<primitive: return _self.alert(_aString);>
	}

	confirm { :self :aString |
		<primitive: return _self.confirm(_aString);>
	}

	fetch { :self :resource |
		<primitive: return _self.fetch(_resource);>
	}

	fetch { :self :resource :options |
		<primitive: return _self.fetch(_resource, _options);>
	}

	fetchBlob { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.blob
		}
	}

	fetchByteArray { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.byteArray
		}
	}

	fetchJson { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.json
		}
	}

	fetchMimeType { :self :resource :mimeType :options  |
		self.fetch(resource, options).then { :response  |
			mimeType.caseOfOtherwise([
				'application/json' -> {
					response.json
				},
				'text/plain' -> {
					response.text
				}
			]) { :unused  |
				self.error('fetchMimeType: unknown mimeType: ' ++ mimeType)
			}
		}
	}

	fetchString { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.text
		}
	}

	localStorage { :self |
		<primitive: return _self.localStorage;>
	}

	location { :self |
		<primitive: return _self.location;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	navigator { :self |
		<primitive: return _self.navigator;>
	}

	prompt { :self :message :defaultValue |
		<primitive: return _self.prompt(_message, _defaultValue);>
	}

	pseudoSlotNameArray { :self |
		['localStorage', 'location', 'name', 'navigator', 'sessionStorage']
	}

	sessionStorage { :self |
		<primitive: return _self.sessionStorage;>
	}

}
