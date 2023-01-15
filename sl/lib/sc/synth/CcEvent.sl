CcEvent {

	v { :self |
		<primitive: return _self.v;>
	}

	w { :self |
		<primitive: return _self.w;>
	}

	x { :self |
		<primitive: return _self.x;>
	}

	y { :self |
		<primitive: return _self.y;>
	}

	z { :self |
		<primitive: return _self.z;>
	}

	o { :self |
		<primitive: return _self.o;>
	}

	rx { :self |
		<primitive: return _self.rx;>
	}

	ry { :self |
		<primitive: return _self.ry;>
	}

	p { :self |
		<primitive: return _self.p;>
	}

}

+ Number {

	CcEvent { :self :anArray |
		<primitive: return new sc.CcEvent(_self, _anArray);>
	}

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

	Voicer { :self :voiceProcedure |
		<primitive: return sc.Voicer(_self, _voiceProcedure);>
	}

}

