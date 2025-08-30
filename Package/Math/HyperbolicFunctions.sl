+SmallFloat{

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
		(1 / self).arcSinh
	}

	arcSech { :self |
		(1 / self).arcCosh
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

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

}

+Complex {

	arcCosh { :z |
		(z + ((z ^ 2) - 1).sqrt).log /* (((z + 1).sqrt * (z - 1).sqrt) + z).log */
	}

	arcCoth { :z |
		(1 / z).arcTanh /* ((z + 1).log - (z - 1).log) / 2 */
	}

	arcCsch { :z |
		(1 / z).arcSinh /* ((1 / z) + ((1 / (z ^ 2)) + 1).sqrt).log */
	}

	arcSech { :z |
		z.isZero.if {
			Infinity
		} {
			z.imaginary.isZero.ifTrue {
				z.imaginary := system.smallFloatMin
			};
			(1 / z).arcCosh
		}
	}

	arcSinh { :z |
		(z + ((z ^ 2) + 1).sqrt).log
	}

	arcTanh { :z |
		((z + 1).log - (1 - z).log) / 2
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
		z.i.tan.i.negate
	}

}

+[SmallFloat, Complex] {

	csch { :self |
		1 / self.sinh
	}

	sech { :self |
		1 / self.cosh
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

	arcCoth { :self |
		self.collect(arcCoth:/1)
	}

	arcCsch { :self |
		self.collect(arcCsch:/1)
	}

	arcSech { :self |
		self.collect(arcSech:/1)
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

	sech { :self |
		self.collect(sech:/1)
	}

	sinh { :self |
		self.collect(sinh:/1)
	}

	tanh { :self |
		self.collect(tanh:/1)
	}

}
