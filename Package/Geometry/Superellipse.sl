Superellipse : [Object, Equal, Geometry] {

	| center a b n |

	area { :self |
		4 * self.a * self.b * (((1 + (1 / self.n)).gamma ^ 2) / (1 + (2 / self.n)).gamma)
	}

	at { :self :theta |
		let f/1 = superellipseCurve(self.a, self.b, self.n);
		f(theta) + self.center
	}

	atAll { :self :theta |
		theta.collect(
			superellipseCurve(self.a, self.b, self.n)
		) + [self.center]
	}

	discretize { :self :anInteger |
		self.atAll(
			(0 -- 2.pi).subdivide(anInteger)
		)
	}

}

+List {

	Superellipse { :center :a :b :n |
		newSuperellipse().initializeSlots(center, a, b, n)
	}

}
