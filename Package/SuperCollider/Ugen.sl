Ugen! : [Object, Number] {

	adaptToIntegerAndApply { :self :aNumber :aBlock/2 |
		adaptToNumberAndApply(self, SmallFloat(aNumber), aBlock/2)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		<primitive:
		return sl.applyGenericAt(
			sl.nameWithoutArity(_aBlock_2.name),
			[_aNumber, _self],
			'Ugen'
		);
		>
	}

	blend { :y1 :y2 :mu |
		/* Copy, c.f. Interpolation */
		y1 + (mu * (y2 - y1))
	}

	isScalar { :self |
		false
	}

	port { :self |
		<primitive: return _self.port>
	}

	printString { :self |
		[
			self.scUgen.printString,
			self.port.printString
		].stringIntercalate(':')
	}

	pseudoSlotNameList { :self |
		['scUgen', 'port']
	}

	scUgen { :self |
		<primitive: return _self.scUgen>
	}

}

+String {

	NamedControl { :self :defaultValue |
		<primitive: return sc.localControlInput(_self, -1, _defaultValue);>
	}

	encodeUgen { :self :ugen |
		self.encodeUgenAt(
			ugen.busOffset,
			ugen
		)
	}

	encodeUgenAt { :self :bus :ugen |
		<primitive: return sc.encodeUgen(_self, sc.wrapOut(_bus, _ugen));>
	}

	kr { :self :defaultValue |
		self.NamedControl(defaultValue)
	}

}

+List {

	busOffset { :self |
		/* ['busOffset', self.size].printLine; */
		self.size.caseOf(
			[
				2 -> {
					system.preference('ScSynth/Outputs/Stereo/BusOffset', 0)
				},
				system.scSynth.mainOutputs -> {
					system.preference('ScSynth/Outputs/Main/BusOffset', 0)
				}
			]
		) {
			0
		}
	}

}

+Ugen {

	busOffset { :self |
		system.preference('ScSynth/Outputs/Mono/BusOffset', 0)
	}

}

+[Ugen, List] {

	printUgenGraph { :self |
		<primitive: return sc.printSyndefOfAt(_self, _self.busOffset);>
	}

}
