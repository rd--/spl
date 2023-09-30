ContinuousEvent : [Object] { | contents |

	i { :self |
		self.contents[5]
	}

	j { :self |
		self.contents[6]
	}

	k { :self |
		self.contents[7]
	}

	p { :self |
		self.contents[8]
	}

	w { :self |
		self.contents[1]
	}

	x { :self |
		self.contents[2]
	}

	y { :self |
		self.contents[3]
	}

	z { :self |
		self.contents[4]
	}

}

+Array {

	ContinuousEvent { :self |
		self.assertIsOfSize(8);
		newContinuousEvent().initializeSlots(self)
	}

}

+Void {

	ContinuousEvent {
		newContinuousEvent().initializeSlots([0 0 0 0 0 0 0 0])
	}

}

+@Dictionary {

	ContinuousEvent { :self |
		[
			self::w :? { 0 },
			self::x :? { 0 },
			self::y :? { 0 },
			self::z :? { 0 },
			self::i :? { 0 },
			self::j :? { 0 },
			self::k :? { 0 },
			self::p :? { 0 }
		].ContinuousEvent
	}

	Voicer { :self :aBlock:/1 |
		self.multiChannelExpand.collect { :each |
			aBlock(each.kr.ContinuousEvent)
		}
	}

}

+@Integer {

	Voicer { :self :voiceBlock |
		<primitive: return sc.Voicer(_self, _voiceBlock);>
	}

}

+@Integer {

	KeyDown { :self | <primitive: return sc.KeyDown(_self);> }
	KeyTimbre { :self | <primitive: return sc.KeyTimbre(_self);> }
	KeyPressure { :self | <primitive: return sc.KeyPressure(_self);> }
	KeyVelocity { :self | <primitive: return sc.KeyVelocity(_self);> }
	KeyPitch { :self | <primitive: return sc.KeyPitch(_self);> }

	PenDown { :self | <primitive: return sc.PenDown(_self);> }
	PenX { :self | <primitive: return sc.PenX(_self);> }
	PenY { :self | <primitive: return sc.PenY(_self);> }
	PenZ { :self | <primitive: return sc.PenZ(_self);> }
	PenAngle { :self | <primitive: return sc.PenAngle(_self);> }
	PenRadius { :self | <primitive: return sc.PenRadius(_self);> }

}
