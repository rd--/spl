+System {

	unicodeCharacterDatabase { :self |
		self.requireLibraryItem('UnicodeCharacterDatabase')
	}

}

LibraryItem(
	name: 'UnicodeCharacterDatabase',
	category: 'Text/Encoding',
	url: 'https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt',
	mimeType: 'text/plain',
	parser: { :item |
		item.lines.collect { :each |
			each.splitBy(';')
		}
	}
)
