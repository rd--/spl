BarycentricCoordinates : [Object] { | coordinates |

	asCartesianCoordinates { :self :aSimplex |
		CartesianCoordinates(
			(self.coordinates * aSimplex.coordinates).sum
		)
	}

}

+List {

	BarycentricCoordinates { :self |
		newBarycentricCoordinates().initializeSlots(self)
	}

	fromBarycentricCoordinates { :a :b :c |
		let v = [a, b, c];
		{ :lambda |
			(lambda * v).sum
		}
	}

	fromBarycentricCoordinates { :a :b :c :d |
		let v = [a, b, c, d];
		{ :lambda |
			(lambda * v).sum
		}
	}

	toBarycentricCoordinates { :a :b :c |
		let t = [
			[a[1] - c[1], b[1] - c[1]],
			[a[2] - c[2], b[2] - c[2]]
		];
		{ :p |
			let [u, v] = t.inverse.dot(p - c);
			[u, v, 1 - u - v]
		}
	}

	toBarycentricCoordinates { :a :b :c :d |
		let f = { :u :v :w :x |
			[u v w x]
			.arrayPad([0 0; 0 1], 1)
			.transposed
			.determinant
		};
		let z = f(a, b, c, d);
		{ :p |
			let u = f(p, b, c, d) / z;
			let v = f(a, p, c, d) / z;
			let w = f(a, b, p, d) / z;
			[u, v, w, 1 - u - v - w]
		}
	}

	toBarycentricCoordinatesVertexApproach { :a :b :c |
		let v0 = b - a;
		let v1 = c - a;
		let d00 = dot(v0, v0);
		let d01 = dot(v0, v1);
		let d11 = dot(v1, v1);
		let m = 1 / ((d00 * d11) - (d01 * d01));
		{ :p |
			let v2 = p - a;
			let d20 = dot(v2, v0);
			let d21 = dot(v2, v1);
			let v = ((d11 * d20) - (d01 * d21)) * m;
			let w = ((d00 * d21) - (d01 * d20)) * m;
			let u = 1 - v - w;
			[u, v, w]
		}
	}

}
