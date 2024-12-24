+System {

	unicodeData { :self |
		self.requireLibraryItem('Text/Unicode/CharacterDatabase')
	}

}

LibraryItem(
	name: 'Text/Unicode/CharacterDatabase',
	url: 'https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt',
	mimeType: 'text/plain',
	parser: { :item |
		item.lines.collect { :each |
			each.splitBy(';')
		}
	}
)
