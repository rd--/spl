(* Requires: EventTarget Url *)

WebSocket! : [Object, EventTarget] {

	basicOnOpen { :self :aBlock:/1 |
		<primitive:
		_self.onopen = _aBlock_1;
		return _self;
		>
	}

	binaryType { :self |
		<primitive: return _self.binaryType;>
	}

	binaryType { :self :value |
		<primitive:
		_self.binaryType = _value;
		return _self;
		>
	}

	bufferedAmount { :self |
		<primitive: return _self.bufferedAmount;> (* Read only *)
	}

	close { :self |
		<primitive: return _self.close();>
	}

	close { :self :code :reason |
		<primitive: return _self.close(_code, _reason);>
	}

	extensions { :self |
		<primitive: return _self.extensions;> (* Read only *)
	}

	onClose { :self :aBlock:/1 |
		<primitive:
		_self.onclose = _aBlock_1;
		return _self;
		>
	}

	onMessage { :self :aBlock:/1 |
		<primitive:
		_self.onmessage = _aBlock_1;
		return _self;
		>
	}

	onOpen { :self :aBlock |
		self.basicOnOpen { :event |
			aBlock.cull(event)
		}
	}

	protocol { :self |
		<primitive: return _self.protocol;> (* Read only *)
	}

	readyState { :self |
		<primitive: return _self.readyState;> (* Read only *)
	}

	send { :self :data |
		<primitive: return _self.send(_data);>
	}

	url { :self |
		<primitive: return _self.url;> (* Read only *)
	}

}

+[String, URL] {

	WebSocket { :self |
		<primitive: return new WebSocket(_self);>
	}

	WebSocket { :self :protocols |
		<primitive: return new WebSocket(_self, _protocols);>
	}

}
