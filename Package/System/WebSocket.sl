/* Requires: EventTarget Url */

WebSocket! : [Object, EventTarget] {

	binaryType { :self |
		<primitive:
		return _self.binaryType;
		>
	}

	binaryType { :self :value |
		<primitive:
		_self.binaryType = _value;
		return _self;
		>
	}

	bufferedAmount { :self |
		<primitive:
		return _self.bufferedAmount;
		>
	}

	close { :self |
		<primitive:
		return _self.close();
		>
	}

	close { :self :code :reason |
		<primitive:
		return _self.close(sl.toFloat(_code), _reason);
		>
	}

	extensions { :self |
		<primitive:
		return _self.extensions;
		>
	}

	onClose { :self :aFunction/1 |
		<primitive:
		_self.onclose = _aFunction_1;
		return _self;
		>
	}

	onMessage { :self :aFunction/1 |
		<primitive:
		_self.onmessage = _aFunction_1;
		return _self;
		>
	}

	onOpen { :self :aFunction |
		self.uncheckedOnOpen { :event |
			aFunction.cull(event)
		}
	}

	protocol { :self |
		<primitive:
		return _self.protocol;
		>
	}

	readyState { :self |
		<primitive:
		return _self.readyState;
		>
	}

	send { :self :data |
		<primitive:
		return _self.send(_data);
		>
	}

	uncheckedOnOpen { :self :aFunction/1 |
		<primitive:
		_self.onopen = _aFunction_1;
		return _self;
		>
	}

	url { :self |
		<primitive:
		return _self.url;
		>
	}

}

+[String, URL] {

	WebSocket { :self |
		<primitive:
		return new WebSocket(_self);
		>
	}

	WebSocket { :self :protocols |
		<primitive:
		return new WebSocket(_self, _protocols);
		>
	}

}
