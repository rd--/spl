HalfPlane : [Object, Equatable] { | p v w |

}

+List {

	dihedralAngle { :p :v |
		let [p1, p2] = p;
		let [v1, v2] = v;
		let v0 = p2 - p1;
		let c1 = v0.cross(v1);
		let c2 = v0.cross(v2);
		(c1.dot(c2) / (c1.norm * c2.norm)).arcCos
		/* (v2.norm * v1).dot(c2).arcTan(c1.dot(c2)) */
	}

	HalfPlane { :p :v :w |
		newHalfPlane().initializeSlots(p, v, w)
	}

}
