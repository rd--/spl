/* Requires: LibraryItem */

SuperColliderProgramIndex : [Object] { | contents |

	atRandom { :self |
		self.contents.atRandom
	}

	authors { :self :category |
		self.contents.select { :each |
			each[1] = category
		}.collect(second:/1).copyWithoutIdenticalElements.sort
	}

	categories { :self |
		self
		.contents
		.collect(first:/1)
		.copyWithoutIdenticalElements
		.sort
		.reject { :each |
			each = 'collect'
		}
	}

	names { :self :category :author |
		self.contents.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sort
	}

}

+String {

	SuperColliderProgramIndex { :self |
		newSuperColliderProgramIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				each.replaceString('.sl', '').splitByRegExp(RegExp(' - |/'))
			}
		)
	}

}

+System {

	superColliderProgramIndex { :self |
		self.requestLibraryItem('Music/SuperCollider/ProgramIndex')
	}

	superColliderProgramOracle { :self |
		self.requestLibraryItem('Music/SuperCollider/ProgramOracle')
	}

}

LibraryItem(
	name: 'Music/SuperCollider/ProgramIndex',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursPrograms.text',
	mimeType: 'text/plain',
	parser: SuperColliderProgramIndex:/1
)

LibraryItem(
	name: 'Music/SuperCollider/ProgramOracle',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursOracle.text',
	mimeType: 'text/plain',
	parser: SuperColliderProgramIndex:/1
)
