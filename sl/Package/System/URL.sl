(* {"requires": ["Blob", "File"]} *)

URL! : [Object] {

	asUrl { :self |
		self
	}

	fetch { :self |
		<primitive: return fetch(_self);>
	}

	fetchText { :self |
		self.fetch.then { :response |
			response.text
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

	origin { :self |
		<primitive: return _self.origin;> (* Read only *)
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

	terseGuideSummary { :self |
		self.fetchText.then { :text |
			text.terseGuideSummary
		}
	}

	username { :self |
		<primitive: return _self.username;> (* Read only *)
	}

}

+String {

	asFileUrl { :self |
		('file://' ++ self).asUrl
	}

	asUrl { :self |
		self.URL
	}

	decodeURI { :self |
		<primitive: return decodeURI(_self);>
	}

	decodeURIComponent { :self |
		<primitive: return decodeURIComponent(_self);>
	}

	encodeURI { :self |
		<primitive: return encodeURI(_self);>
	}

	encodeURIComponent { :self |
		<primitive: return encodeURIComponent(_self);>
	}

	revokeObjectURL { :self |
		<primitive: return URL.revokeObjectURL(_self);>
	}

	URL { :self |
		<primitive: return new URL(_self);>
	}

	URL { :self :base |
		<primitive: return new URL(_self, _base);>
	}

}

+[File, Blob] {

	createObjectURL { :self |
		<primitive: return URL.createObjectURL(_self);>
	}

}

URLSearchParams : [Object] {

	append { :self :name :value |
		<primitive: return _self.delete(_name, _value);>
	}

	delete { :self :name |
		<primitive: return _self.delete(_name);>
	}

	get { :self :name |
		<primitive: return _self.get(_name);>
	}

	has { :self :name |
		<primitive: return _self.has(_name);>
	}

}

+[String, Record] {

	URLSearchParams { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}
