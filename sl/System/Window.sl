ArrayBuffer : [Object] {

	byteLength { :self | <primitive: return _self.byteLength;> }
	size { :self | <primitive: return _self.byteLength;> }

	ByteArray { :self | <primitive: return new Uint8Array(_self);> }
	Float64Array { :self | <primitive: return new Float64Array(_self);> }

}

Response : [Object] {

	arrayBuffer { :self | <primitive: return _self.arrayBuffer();> }
	byteArray { :self | <primitive: return _self.arrayBuffer().then(function(b) { return new Uint8Array(b); });> }
	text { :self | <primitive: return _self.text();> }

}

Window : [Object] {

	alert { :self :aString | <primitive: return _self.alert(_aString);> }
	confirm { :self :aString | <primitive: return _self.confirm(_aString);> }
	document { :self | <primitive: return _self.document;> }
	fetch { :self :resource | <primitive: return _self.fetch(_resource);> }
	fetch { :self :resource :options | <primitive: return _self.fetch(_resource, Object.fromEntries(_options));> }
	getComputedStyle { :self :element | <primitive: return _self.getComputedStyle(_element);> }
	getSelectedText { :self | <primitive: return _self.getSelection().toString();> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	localStorage { :self | <primitive: return _self.localStorage;> }
	location { :self | <primitive: return _self.location;> }
	name { :self | <primitive: return _self.name;> }
	navigator { :self | <primitive: return _self.navigator;> }
	prompt { :self :message :defaultValue | <primitive: return _self.prompt(_message, _defaultValue);> }
	sessionStorage { :self | <primitive: return _self.sessionStorage;> }

	fetchByteArray { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.byteArray
		}
	}

	fetchString { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.text
		}
	}

}
