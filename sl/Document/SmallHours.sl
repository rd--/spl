SmallHours : [Object] { | programs |

	loadPrograms { :self |
		system.window.fetchString('./text/smallhours-programs.text', (cache: 'no-cache')).then { :aString |
			self.programs := aString.lines.select(notEmpty:/1).collect { :each |
				self.programParse(each)
			}
		}
	}

	programAuthors { :self :category |
		self.programs.select { :each |
			each.first = category
		}.collect(second:/1).IdentitySet.Array.sorted
	}

	programBrowser { :self |
		ColumnBrowser(
			'SmallHoursProgramBrowser',
			[1, 1, 3],
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.programCategories
					},
					1 -> {
						self.programAuthors(path[1])
					},
					2 -> {
						self.programNames(path[1], path[2])
					},
					3 -> {
						self.programFetch(path[1], path[2], path[3])
					}
				])
			}
		)
	}

	programCategories { :self |
		self.programs.collect(first:/1).IdentitySet.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		system.window.fetchString(self.programUrl(category, author, name), (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programs.select { :each |
			each.first = category & {
				each.second = author
			}
		}.collect(third:/1).IdentitySet.Array.sorted
	}

	programParse { :self :aString |
		aString.splitRegExp(RegExp(' - |/'))
	}

	programUrl { :self :category :author :name |
		['./lib/stsc3/help/', category, '/', author, ' - ', name].join
	}

}

+ Void {

	SmallHours {
		newSmallHours()
	}

}
