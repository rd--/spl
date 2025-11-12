+List {

	cross { :u |
		let [x, y] = u;
		[y.-, x]
	}

	cross { :u :v |
		let k = u.size;
		(k = 2).if {
			let [ux, uy] = u;
			let [vx, vy] = v;
			(ux * vy) - (uy * vx)
		} {
			let [ux, uy, uz] = u;
			let [vx, vy, vz] = v;
			[
				(uy * vz) - (uz * vy),
				(uz * vx) - (ux * vz),
				(ux * vy) - (uy * vx)
			]
		}
	}

	crossedMultiply { :self :aList |
		self.withCollectCrossed(aList, *)
	}

	scalarTripleProduct { :a :b :c |
		a.dot(b.cross(c))
	}

	vectorTripleProduct { :a :b :c |
		a.cross(b.cross(c))
	}

}
