+Float {

	arcCosh { :self |
		<primitive:
		if(_self >= 1) {
			return Math.acosh(_self);
		}
		>
		Complex(self, 0).arcCosh
	}

	arcCoth { :self |
		(1 / self).arcTanh
	}

	arcCsch { :self |
		(1.0 / self).arcSinh
	}

	arcSech { :self |
		(1.0 / self).arcCosh
	}

	arcSinh { :self |
		<primitive: return Math.asinh(_self)>
	}

	arcTanh { :self |
		<primitive: return Math.atanh(_self)>
	}

	cosh { :self |
		<primitive: return Math.cosh(_self);>
	}

	coth { :self |
		self.cosh / self.sinh
	}

	hyperbolaCurve { :a :b |
		{ :x :y |
			(x.square / a.square) - (y.square / b.square) - 1
		}
	}

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

}

+Complex {

	arcCosh { :z |
		(z + ((z - 1J0).sqrt * (z + 1J0).sqrt)).log
	}

	arcCoth { :z |
		(1J0 / z).arcTanh /* ((z + 1.0).log - (z - 1.0).log) / 2 */
	}

	arcCsch { :z |
		(1J0 / z).arcSinh /* ((1J0 / z) + ((1J0 / z.square) + 1J0).sqrt).log */
	}

	arcSech { :z |
		z.isZero.if {
			Infinity
		} {
			z.imaginary.isZero.ifTrue {
				z.imaginary := system.floatMin
			};
			(1J0 / z).arcCosh
		}
	}

	arcSinh { :z |
		(z + (z.square + 1J0).sqrt).log
	}

	arcTanh { :z |
		((z + 1.0).log - (1.0 - z).log) / 2.0
	}

	cosh { :z |
		let i = z.imaginary;
		let r = z.real;
		Complex(
			r.cosh * i.cos,
			r.sinh * i.sin
		)
	}

	coth { :z |
		let n = (2.0 * z).exp;
		(n + 1.0) / (n - 1.0)
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
		z.i.tan.i.negate
	}

}

+[Float, Complex] {

	csch { :self |
		1.0 / self.sinh
	}

	sech { :self |
		1.0 / self.cosh
	}

}

+@Number {

	gudermannian { :z |
		z.sinh.arcTan
	}

	inverseGudermannian { :z |
		z.isVeryClose(0.0).if {
			0.0
		} {
			((z * 0.5) + 0.25.pi).tan.log
		}
	}

}

+[Float, Complex] {

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
		self.collect(arcCosh/1)
	}

	arcCoth { :self |
		self.collect(arcCoth/1)
	}

	arcCsch { :self |
		self.collect(arcCsch/1)
	}

	arcSech { :self |
		self.collect(arcSech/1)
	}

	arcSinh { :self |
		self.collect(arcSinh/1)
	}

	arcTanh { :self |
		self.collect(arcTanh/1)
	}

	cosh { :self |
		self.collect(cosh/1)
	}

	coth { :self |
		self.collect(coth/1)
	}

	sech { :self |
		self.collect(sech/1)
	}

	sinh { :self |
		self.collect(sinh/1)
	}

	tanh { :self |
		self.collect(tanh/1)
	}

}

+@ImplicitFloat {

	arcCosh { :self |
		Float(self).arcCosh
	}

	arcCoth { :self |
		Float(self).arcCoth
	}

	arcCsch { :self |
		Float(self).arcCsch
	}

	arcSech { :self |
		Float(self).arcSech
	}

	arcSinh { :self |
		Float(self).arcSinh
	}

	arcTanh { :self |
		Float(self).arcTanh
	}

	cosh { :self |
		Float(self).cosh
	}

	coth { :self |
		Float(self).coth
	}

	csch { :self |
		Float(self).csch
	}

	sech { :self |
		Float(self).sech
	}

	sinh { :self |
		Float(self).sinh
	}

	tanh { :self |
		Float(self).tanh
	}

}
