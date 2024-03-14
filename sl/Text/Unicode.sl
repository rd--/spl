+@Cache {

	unicodeData { :self |
		self.useLibraryItem(
			LibraryItem(
				'unicodeData',
				'https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt',
				'text/plain',
				{ :libraryItem |
					libraryItem.lines.collect { :each |
						each.splitBy(';')
					}
				}
			)
		)
	}

}
