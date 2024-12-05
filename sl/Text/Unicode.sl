+@Cache {

	unicodeData { :self |
		self.requireLibraryItem('unicodeData')
	}

}

LibraryItem(
	name: 'unicodeData',
	url: 'https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt',
	mimeType: 'text/plain',
	parser: { :libraryItem |
		libraryItem.lines.collect { :each |
			each.splitBy(';')
		}
	}
)
