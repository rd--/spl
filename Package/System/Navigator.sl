Navigator! : [Object] {

	deviceMemory { :self |
		<primitive: return _self.deviceMemory;>
	}

	geolocation { :self |
		<primitive: return _self.geolocation;>
	}

	getBattery { :self |
		<primitive: return _self.getBattery();>
	}

	gpu { :self |
		<primitive: return _self.gpu;>
	}

	hardwareConcurrency { :self |
		<primitive: return _self.hardwareConcurrency;>
	}

	language { :self |
		<primitive: return _self.language;>
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

+System {

	navigator { :self |
		<primitive: return _self.window.navigator;>
	}

}
