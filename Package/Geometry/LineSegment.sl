LineSegment : [Object] { | u v |

	arcLength { :self |
		self.u.euclideanDistance(self.v)
	}

	at { :self :index |
		index.caseOf([
			1 -> { self.u },
			2 -> { self.v }
		])
	}

	boundingBox { :self |
		self.vertexCoordinates.minMax
	}

	centroid { :self |
		self.midpoint
	}

	dimension { :self |
		1
	}

	distance { :self :aPoint |
		[self.u, self.v].pointLineDistance(aPoint)
	}

	embeddingDimension { :self |
		self.u.size
	}

	svgFragment { :self :options |
		Line([self.u, self.v]).svgFragment(options)
	}

	includes { :self :aPoint |
		self.distance(aPoint).isVeryCloseTo(0)
	}

	midpoint { :self |
		[self.u, self.v].midpoint
	}

	project { :self :projection |
		let f:/1 = projection.asUnaryBlock;
		LineSegment(
			f(self.u),
			f(self.v)
		)
	}

	vertexCoordinates { :self |
		[self.u, self.v]
	}

	vertexCount { :self |
		2
	}

}

+List {

	connectLineSegments { :self :eq:/2 |
		let answer = [];
		{
			self.isEmpty.not
		}.whileTrue {
			let l = self[1];
			let [p, q] = l;
			let i = 1;
			self.removeAt(1);
			{
				i <= self.size
			}.whileTrue {
				let [a, b] = self[i];
				let matched = true;
				eq(p, a).if {
					l.addFirst(b);
					p := b
				} {
					eq(p, b).if {
						l.addFirst(a);
						p := a
					} {
						eq(q, a).if {
							l.addLast(b);
							q := b
						} {
							eq(q, b).if {
								l.addLast(a);
								q := a
							} {
								matched := false
							}
						}
					}
				};
				matched.if {
					self.removeAt(i);
					i := 1
				} {
					i := i + 1
				}
			};
			answer.add(l)
		};
		answer
	}

	LineSegment { :u :v |
		newLineSegment().initializeSlots(u, v)
	}

}
