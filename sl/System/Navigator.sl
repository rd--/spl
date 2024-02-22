Navigator! : [Object] {

	hardwareConcurrency { :self |
		<primitive: return _self.hardwareConcurrency;>
	}

	maxTouchPoints { :self |
		<primitive: return _self.maxTouchPoints;>
	}

	requestMidiAccess { :self |
		<primitive: return _self.requestMIDIAccess();>
	}

	requestMidiAccess { :self :midiOptions |
		<primitive: return _self.requestMIDIAccess(_midiOptions);>
	}

	sendBeacon { :self :data |
		<primitive: return _self.sendBeacon(_self, _data);>
	}

	storage { :self |
		<primitive: return _self.storage;>
	}

	userAgent { :self |
		<primitive: return _self.userAgent;>
	}

}
