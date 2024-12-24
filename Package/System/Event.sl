@Event {

	cancelable { :self |
		<primitive: return _self.cancelable;>
	}

	preventDefault { :self |
		<primitive: return _self.preventDefault();>
	}

	stopImmediatePropagation { :self |
		<primitive: return _self.stopImmediatePropagation();>
	}

	stopPropagation { :self |
		<primitive: return _self.stopPropagation();>
	}

	stopPropagationAndPreventDefault { :self |
		self.stopPropagation;
		self.cancelable.ifTrue {
			self.preventDefault
		}
	}

	target { :self |
		<primitive: return _self.target;>
	}

	timeStamp { :self |
		<primitive: return _self.timeStamp;>
	}

	type { :self |
		<primitive: return _self.type;>
	}

}

Event! : [Object, Event] {

}

+String {

	Event { :self |
		<primitive: return new Event(_self);>
	}

}
