+@Cache {

	superColliderProgramOracle { :self |
		self.useLibraryItem('superColliderProgramOracle')
	}

}

SuperColliderProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.superColliderProgramIndex.then { :superColliderProgramIndex |
			smallKansas.superColliderProgramOracle.then { :superColliderProgramOracle |
				smallKansas.addFrame(
					smallKansas.SuperColliderProgramBrowser(
						superColliderProgramIndex,
						superColliderProgramOracle.atRandom
					),
					event
				)
			}
		}
	}

}

LibraryItem(
	name: 'superColliderProgramOracle',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursOracle.text',
	mimeType: 'text/plain',
	parser: SuperColliderProgramIndex:/1
)
