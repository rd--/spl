/* Requires: LibraryItem */

+String {

	unicodeItalic { :self |
		self.isCharacter.if {
			system.unicodeItalicTable.at(self)
		} {
			self.characters.collect(unicodeItalic:/1).stringJoin
		}
	}

	unicodeSubscript { :self |
		self.isCharacter.if {
			system.unicodeSubscriptTable.at(self)
		} {
			self.characters.collect(unicodeSubscript:/1).stringJoin
		}
	}

	unicodeSuperscript { :self |
		self.isCharacter.if {
			system.unicodeSuperscriptTable.at(self)
		} {
			self.characters.collect(unicodeSuperscript:/1).stringJoin
		}
	}

}


+System {

	unicodeCharacterDatabase { :self |
		self.requireLibraryItem('UnicodeCharacterDatabase')
	}

	unicodeItalicTable { :self |
		self.cached('unicodeItalicTable') {
			let c = 'abcdefgijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZh'.characters;
			/* let uB = '𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁'.characters; */
			let u = '𝑎𝑏𝑐𝑑𝑒𝑓𝑔𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍ℎ'.characters;
			let m = [c, u].transpose;
			Record(m)
		}
	}

	unicodeSubscriptTable { :self |
		self.cached('unicodeSubscriptTable') {
			let c = '0123456789+-=()aehijklmnoprstuvxə'.characters;
			let u = '₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓₔ'.characters;
			let m = [c, u].transpose;
			Record(m)
		}
	}

	unicodeSuperscriptTable { :self |
		self.cached('unicodeSuperscriptTable') {
			let c = '0123456789+-=()abcdefghijklmnopqrstuvwxyz'.characters;
			let u = '⁰¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖ𐞥ʳˢᵗᵘᵛʷˣʸᶻ'.characters;
			let m = [c, u].transpose;
			Record(m)
		}
	}

}

LibraryItem(
	name: 'UnicodeCharacterDatabase',
	category: 'Text/Encoding',
	url: 'https://rohandrape.net/sw/hsc3-data/data/text/unicode/unicode-character-table.json',
	mimeType: 'application/json',
	parser: identity:/1
)

+System {

	englishStopWords { :self |
		self.requireLibraryItem('EnglishStopWords')
	}

}

LibraryItem(
	name: 'EnglishStopWords',
	category: 'Text/Analysis',
	url: 'https://rohandrape.net/sw/hsc3-data/data/text/stopwords-mathematica.text',
	mimeType: 'application/json',
	parser: identity:/1
)
