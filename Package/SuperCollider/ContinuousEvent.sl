ContinuousEvent : [Object] { | signalList |

	i { :self |
		self.signalList[5]
	}

	j { :self |
		self.signalList[6]
	}

	k { :self |
		self.signalList[7]
	}

	List { :self |
		self.signalList.copy
	}

	p { :self |
		self.signalList[8]
	}

	w { :self |
		self.signalList[1]
	}

	x { :self |
		self.signalList[2]
	}

	y { :self |
		self.signalList[3]
	}

	z { :self |
		self.signalList[4]
	}

}

+List {

	ContinuousEvent { :self |
		self.assertIsOfSize(8);
		newContinuousEvent().initializeSlots(self.kr) /* control rate? */
	}

}

+Void {

	ContinuousEvent {
		ContinuousEvent[0 0 0 0 0 0 0 0]
	}

}

+Record {

	ContinuousEvent { :self |
		ContinuousEvent[
			self.atIfAbsent('w') { 0 },
			self.atIfAbsent('x') { 0 },
			self.atIfAbsent('y') { 0 },
			self.atIfAbsent('z') { 0 },
			self.atIfAbsent('i') { 0 },
			self.atIfAbsent('j') { 0 },
			self.atIfAbsent('k') { 0 },
			self.atIfAbsent('p') { 0 }
		]
	}

	Voicer { :self :aBlock/1 |
		self.multiChannelExpand.collect { :x |
			aBlock(ContinuousEvent(x))
		}
	}

}

+@Integer {

	voicerVoiceAddress { :part :voice |
		let addrZero = 13000;
		let maxEventParam = 10;
		let maxVoices = 24;
		addrZero + (part - 1 * maxVoices * maxEventParam) + (voice - 1 * maxEventParam)
	}

	Voicer { :part :voice :voiceBlock/1 |
		1.toCollect(voice) { :each |
			let bus = part.voicerVoiceAddress(each);
			ContinuousEvent(
				ControlIn(8, bus)
			).voiceBlock
		}
	}

}

+@Integer {

	VoiceWriter { :part :numVoices :voiceBlock/0 |
		1.toCollect(numVoices) { :voice |
			ControlOut(
				part.voicerVoiceAddress(voice),
				ContinuousEvent(
					voiceBlock()
				).List
			)
		}
	}

}

+[SmallFloat, List] {

	KeyDown { :voiceNumber | <primitive: return sc.KeyDown(_voiceNumber);> }
	KeyTimbre { :voiceNumber | <primitive: return sc.KeyTimbre(_voiceNumber);> }
	KeyPressure { :voiceNumber | <primitive: return sc.KeyPressure(_voiceNumber);> }
	KeyVelocity { :voiceNumber | <primitive: return sc.KeyVelocity(_voiceNumber);> }
	KeyPitch { :voiceNumber | <primitive: return sc.KeyPitch(_voiceNumber);> }

	PenDown { :voiceNumber | <primitive: return sc.PenDown(_voiceNumber);> }
	PenX { :voiceNumber | <primitive: return sc.PenX(_voiceNumber);> }
	PenY { :voiceNumber | <primitive: return sc.PenY(_voiceNumber);> }
	PenZ { :voiceNumber | <primitive: return sc.PenZ(_voiceNumber);> }
	PenAngle { :voiceNumber | <primitive: return sc.PenAngle(_voiceNumber);> }
	PenRadius { :voiceNumber | <primitive: return sc.PenRadius(_voiceNumber);> }

}
