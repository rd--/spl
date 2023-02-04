Navigator : [Object] {

	maxTouchPoints { :self |
		<primitive: return _self.maxTouchPoints;>
	}

	requestMidiAccess { :self |
		<primitive: return _self.requestMIDIAccess();>
	}

	requestMidiAccess { :self :midiOptions |
		<primitive: return _self.requestMIDIAccess(Object.fromEntries(_midiOptions));>
	}

	storage { :self |
		<primitive: return _self.storage;>
	}

	userAgent  { :self |
		<primitive: return _self.userAgent;>
	}

}
