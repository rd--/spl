+List {

	gallPetersProjection { :self |
		let [lambda, phi] = self;
		[phi, 2 * lambda.sin]
	}

	gallStereographicProjection { :self |
		let [lambda, phi] = self;
		[
			phi / 2.sqrt,
			(1 + (2.sqrt / 2)) * (lambda / 2).tan
		]
	}

	mercatorProjection { :self |
		let [phi, lambda] = self;
		[
			lambda,
			phi.tan.arcSinh
		]
	}

}

+String {

	namedCartographicProjection { :self |
		self.caseOf([
			'Gall-Peters' -> { gallPetersProjection:/1 },
			'Gall Stereographic' -> { gallStereographicProjection:/1 },
			'Mercator' -> { mercatorProjection:/1 }
		])
	}

	naturalEarthData { :self |
		self
		.naturalEarthUrl
		.fetchJson
		.then { :data |
			GeoJson(data)
		}
	}

	naturalEarthUrl { :self |
		[
			'https://raw.githubusercontent.com/'
			'nvkelso/natural-earth-vector/'
			'refs/heads/master/geojson/'
			self
			'.geojson'
		].stringCatenate.asUrl
	}

	withNaturalEarthData { :self :aBlock:/1 |
		self
		.naturalEarthUrl
		.fetchJson
		.then { :data |
			aBlock(GeoJson(data))
		}
	}

}

+System {

	continentOutlines { :self :dataSet |
		(dataSet = 'LowResolution').if {
			self.requireLibraryItem('ContinentOutlines/LowResolution')
		} {
			self.error('System>>continentOutlines: unknown data set')
		}
	}

}

LibraryItem(
	name: 'ContinentOutlines/LowResolution',
	category: 'Protocol/GeoJson',
	url: 'https://rohandrape.net/sw/hsc3-data/data/cartography/ContinentOutlines-LowResolution.json',
	mimeType: 'application/json',
	parser: GeoJson:/1
)
