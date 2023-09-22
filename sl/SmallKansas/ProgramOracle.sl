+@Cache {

	programOracle { :self |
		self.useLibraryItem(
			LibraryItem(
				'programOracle',
				'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
				'text/plain',
				ProgramIndex:/1
			)
		)
	}

}

ProgramOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.programIndex.then { :programIndex |
			smallKansas.programOracle.then { :programOracle |
				smallKansas.addFrame(
					smallKansas.ProgramBrowser(
						programIndex,
						programOracle.atRandom
					),
					event
				)
			}
		}
	}

}
