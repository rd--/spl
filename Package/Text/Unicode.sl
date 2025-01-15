/* Requires: LibraryItem */

+System {

	unicodeCharacterDatabase { :self |
		self.requireLibraryItem('UnicodeCharacterDatabase')
	}

}

LibraryItem(
	name: 'UnicodeCharacterDatabase',
	category: 'Text/Encoding',
	url: 'https://rohandrape.net/sw/hsc3-data/data/text/unicode/unicode-character-table.json',
	mimeType: 'application/json',
	parser: identity:/1
)
