UgenGraph! : [Object] {

	constantList { :self |
		<primitive: return _self.constantArray>
	}

	controlList { :self |
		<primitive: return _self.controlArray>
	}

	encode { :self |
		<primitive: return sc.graphEncodeSyndef(_self);>
	}

	name { :self |
		<primitive: return _self.name>
	}

	pseudoSlotNameList { :self |
		['name', 'ugenList', 'constantList', 'controlList']
	}

	send { :self |
		let message = OscMessage('/d_recv', [self.encode]);
		system.scSynth.sendOsc(message)
	}

	ugenList { :self |
		<primitive: return _self.ugenArray>
	}

}

+String {

	UgenGraph { :self :ugen |
		self.ugenGraphAt(
			ugen.busOffset,
			ugen
		)
	}

	ugenGraphAt { :self :bus :ugen |
		<primitive: return sc.makeUgenGraph(_self, sc.wrapOut(_bus, _ugen));>
	}

}
