UgenGraph! : [Object] {

	controlArray { :self |
		<primitive: return _self.controlArray>
	}

	constantArray { :self |
		<primitive: return _self.constantArray>
	}

	encode { :self |
		<primitive: return sc.graphEncodeSyndef(_self);>
	}

	name { :self |
		<primitive: return _self.name>
	}

	pseudoSlotNameArray { :self |
		['name', 'ugenArray', 'constantArray', 'controlArray']
	}

	send { :self |
		let message = OscMessage('/d_recv', [self.encode]);
		system.scSynth.sendOsc(message)
	}

	ugenArray { :self |
		<primitive: return _self.ugenArray>
	}

}

+String {

	ugenGraphAt { :self :bus :ugen |
		<primitive: return sc.makeUgenGraph(_self, sc.wrapOut(_bus, _ugen));>
	}

	UgenGraph { :self :ugen |
		self.ugenGraphAt(
			ugen.busOffset,
			ugen
		)
	}

}
