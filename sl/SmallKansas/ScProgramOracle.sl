+@Cache {

	scProgramOracle { :self |
		self.useLibraryItem(
			LibraryItem(
				'scProgramOracle',
				'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
				'text/plain',
				ScProgramIndex:/1
			)
		)
	}

}

ScProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.scProgramIndex.then { :scProgramIndex |
			smallKansas.scProgramOracle.then { :scProgramOracle |
				smallKansas.addFrame(
					smallKansas.ScProgramBrowser(
						scProgramIndex,
						scProgramOracle.atRandom
					),
					event
				)
			}
		}
	}

}
