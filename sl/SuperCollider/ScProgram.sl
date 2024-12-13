/* Requires: LibraryItem */

SuperColliderProgramIndex : [Object] { | contents |

	asTree { :self |
		Tree(
			'SuperColliderProgramIndex',
			self.categories.collect { :category |
				Tree(
					category,
					self.authors(category).collect { :author |
						Tree(
							author,
							self.names(category, author).collect { :name |
								Tree(name, [])
							}
						)
					}
				)
			}
		)
	}

	atRandom { :self |
		self.contents.atRandom
	}

	authors { :self :category |
		self.contents.select { :each |
			each[1] = category
		}
		.collect(second:/1)
		.copyWithoutIdenticalElements
		.sort
	}

	categories { :self |
		self
		.contents
		.collect(first:/1)
		.copyWithoutIdenticalElements
		.sort
	}

	names { :self :category :author |
		self.contents.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sort
	}

	size { :self |
		self.contents.size
	}

}

+List {

	SuperColliderProgramIndex { :self |
		newSuperColliderProgramIndex().initializeSlots(self)
	}

}

+String {

	parseSuperColliderProgramIndex { :self |
		SuperColliderProgramIndex(
			self.lines.select(notEmpty:/1).collect { :each |
				each.replaceString('.sl', '').splitByRegExp(RegExp(' - |/'))
			}
		)
	}

}

+System {

	superColliderProgramIndex { :self |
		self.requireLibraryItem('Music/SuperCollider/ProgramIndex')
	}

	superColliderProgramOracle { :self |
		self.requireLibraryItem('Music/SuperCollider/ProgramOracle')
	}

}

LibraryItem(
	name: 'Music/SuperCollider/ProgramIndex',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursPrograms.text',
	mimeType: 'text/plain',
	parser: parseSuperColliderProgramIndex:/1
)

LibraryItem(
	name: 'Music/SuperCollider/ProgramOracle',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursOracle.text',
	mimeType: 'text/plain',
	parser: parseSuperColliderProgramIndex:/1
)
