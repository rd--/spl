/* Requires: ColumnBrowser SmallKansas */

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

}

+SmallKansas {

	SuperColliderProgramBrowser { :self :index :path |
		self.ColumnBrowser(
			'SuperCollider Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						index.categories
					},
					1 -> {
						index.authors(path[1])
					},
					2 -> {
						index.names(path[1], path[2])
					},
					3 -> {
						let [category, author, name] = path @* [1, 2, 3];
						let url = [
							'./lib/spl/Program/SuperCollider/',
							category,
							'/',
							author,
							' - ',
							name,
							'.play.sl'
						].join('');
						url.fetchTextWithDefault('*Fetch failed*')
					}
				])
			}
		).setPath(path)
	}

	SuperColliderProgramBrowser { :self :index |
		self.SuperColliderProgramBrowser(index, [])
	}

}

SuperColliderProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.superColliderProgramIndex.then { :superColliderProgramIndex |
			smallKansas.addFrame(smallKansas.SuperColliderProgramBrowser(superColliderProgramIndex), event)
		}
	}

}

LibraryItem(
	name: 'Music/SuperCollider/ProgramIndex',
	url: 'https://rohandrape.net/sw/jssc3/text/SmallHoursPrograms.text',
	mimeType: 'text/plain',
	parser: SuperColliderProgramIndex:/1
)
