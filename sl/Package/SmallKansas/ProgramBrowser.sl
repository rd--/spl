ProgramIndex : [Object] { | contents |

	atRandom { :self |
		self.contents.atRandom
	}

	authors { :self :category |
		self.contents.select { :each |
			each[1] = category
		}.collect(second:/1).Set.Array.sort
	}

	categories { :self |
		self.contents.collect(first:/1).Set.Array.sort.reject { :each |
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

	ProgramBrowser { :self :path |
		ColumnBrowser(
			'Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.categories
					},
					1 -> {
						self.authors(path[1])
					},
					2 -> {
						self.names(path[1], path[2])
					},
					3 -> {
						|(
							[category, author, name] = path[1, 2, 3],
							url = ['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join
						)|
						system.window.fetchString(url, (cache: 'no-cache'))
					}
				])
			}
		).setPath(path)
	}

	ProgramBrowser { :self |
		self.ProgramBrowser([])
	}

}

+String {

	ProgramIndex { :self |
		newProgramIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				each.replaceString('.sl', '').splitRegExp(RegExp(' - |/'))
			}
		)
	}

}

+SmallKansas {

	programIndex { :self |
		self.useLibraryItem(
			LibraryItem(
				'programIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-programs.text',
				'text/plain',
				ProgramIndex:/1
			)
		)
	}

}

ProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.programIndex.then { :programIndex |
			smallKansas.addFrame(programIndex.ProgramBrowser, event)
		}
	}

}
