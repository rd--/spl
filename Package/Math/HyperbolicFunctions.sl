+SmallFloat{

	arcCosh { :self |
		<primitive: return Math.acosh(_self)>
	}

	arcSinh { :self |
		<primitive: return Math.asinh(_self)>
	}

	cosh { :self |
		<primitive: return Math.cosh(_self);>
	}

	coth { :self |
		self.cosh / self.sinh
	}

	sech { :self |
		1 / self.cosh
	}

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

}

+Complex {

	arcSinh { :z |
		(z + ((z ^ 2) + 1).sqrt).log
	}

	coth { :z |
		let n = (2 * z).exp;
		(n + 1) / (n - 1)
	}

	cosh { :z |
		let i = z.imaginary;
		let r = z.real;
		Complex(
			r.cosh * i.cos,
			r.sinh * i.sin
		)
	}

	sinh { :z |
		let i = z.imaginary;
		let r = z.real;
		Complex(
			r.sinh * i.cos,
			r.cosh * i.sin
		)
	}

	tanh { :z |
		z.i.tan.i.negated
	}

}

+[SmallFloat, Complex] {

	csch { :self |
		1 / self.sinh
	}

}

+@Number {

	gudermannian { :z |
		z.sinh.arcTan
	}

	inverseGudermannian { :z |
		((z * 0.5) + 0.25.pi).tan.log
	}

}

+[SmallFloat, Complex] {

	hyperbolicArcCosine { :self |
		self.arcCosh
	}

	hyperbolicArcSine { :self |
		self.arcSinh
	}

	hyperbolicCosine { :self |
		self.cosh
	}

	hyperbolicCotangent { :self |
		self.coth
	}

	hyperbolicSecant { :self |
		self.sech
	}

	hyperbolicSine { :self |
		self.sinh
	}

	hyperbolicTangent { :self |
		self.tanh
	}

}

+@Collection {

	arcCosh { :self |
		self.collect(arcCosh:/1)
	}

	arcSinh { :self |
		self.collect(arcSinh:/1)
	}

	cosh { :self |
		self.collect(cosh:/1)
	}

	coth { :self |
		self.collect(coth:/1)
	}

	sinh { :self |
		self.collect(sinh:/1)
	}

	tanh { :self |
		self.collect(tanh:/1)
	}

}
