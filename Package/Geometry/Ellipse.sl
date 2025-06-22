Ellipse : [Object, Geometry] { | center radii |

	area { :self |
		let [rx, ry] = self.radii;
		(rx * ry).pi
	}

	boundingBox { :self |
		[
			self.center - self.radii,
			self.center + self.radii
		]
	}

	eccentricity { :self |
		let [b, a] = self.radii.sorted;
		(1 - (b / a).squared).sqrt
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let [cx, cy] = self.center;
		let [rx, ry] = self.radii;
		'<ellipse cx="%" cy="%" rx="%" ry="%" />'.format([
			cx.printStringToFixed(precision),
			cy.printStringToFixed(precision),
			rx.printStringToFixed(precision),
			ry.printStringToFixed(precision)
		])
	}

	linearEccentricity { :self |
		let [a, b] = self.radii;
		(a.squared - b.squared).sqrt
	}

	semiLatusRectum { :self |
		let [a, b] = self.radii;
		b.squared / a
	}
}

+List {

	Ellipse { :center :radii |
		(center.rank > 1).if {
			center.withCollect(radii, Ellipse:/2)
		} {
			(radii.size = 2).if {
				newEllipse().initializeSlots(center, radii)
			} {
				'Sequence>>Ellipse: invalid radii'.error
			}
		}
	}

}
