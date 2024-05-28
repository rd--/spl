{- Requires: Cache -}

HelpFile : [Object, Cache] { | origin source cache |

	categories { :self |
		self.readCommaSeparatedField('Categories: ')
	}

	codeBlocks { :self |
		self.cached('codeBlocks') {
			self.markdown.codeBlocks
		}
	}

	description { :self |
		let index = 3;
		self.hasSignatures.ifTrue {
			index := index + self.signatures.size + 1
		};
		self.paragraphFrom(index)
	}

	documentTests { :self |
		self.cached('documentTests') {
			self.lines.extractDocumentTests
		}
	}

	extractDocumentTests { :self |
		self.lines.extractDocumentTests
	}

	fencedCodeBlockLineRanges { :self |
		let answer = [];
		self.markdown.do { :each |
			(each::type = 'codeBlock').ifTrue {
				let [start, end] = each::sourcePosition;
				self.lines[start[1]].isCodeFence.ifTrue {
					answer.add(Range(start[1], end[1], 1))
				}
			}
		};
		answer
	}

	hasDocumentTests { :self |
		self.documentTests.notEmpty
	}

	hasRationale { :self |
		self.rationale.notEmpty
	}

	hasReferences { :self |
		self.references.notEmpty
	}

	hasSignatures { :self |
		self.signatures.notEmpty
	}

	hasUnicode { :self |
		self.unicode.notEmpty
	}

	lines { :self |
		self.cached('lines') {
			self.source.lines
		}
	}

	linesFromWhile { :self :index :aBlock:/2 |
		let lines = self.lines;
		let limit = lines.size;
		let answer = [];
		{
			index <= limit & {
				aBlock(lines[index], index)
			}
		}.whileTrue {
			answer.add(lines[index]);
			index := index + 1
		};
		answer
	}

	markdown { :self |
		self.cached('markdown') {
			Markdown(self.source)
		}
	}

	name { :self |
		self.cached('name') {
			let entry = self.lines[1];
			entry.beginsWith('# ').if {
				entry.drop(2)
			} {
				self.error('HelpFile>>name')
			}
		}
	}

	paragraphFrom { :self :index |
		self.linesFromWhile(index) { :each :unusedIndex |
			each.notEmpty
		}
	}

	rationale { :self |
		self.readParagraphField('_Rationale_:')
	}

	readCommaSeparatedField { :self :prefix |
		self.cached(prefix) {
			self.lines.detectIfFoundIfNone { :each |
				each.beginsWith(prefix)
			} { :item |
				item.drop(prefix.size).splitBy(', ')
			} {
				[]
			}
		}
	}

	readParagraphField { :self :prefix |
		self.cached(prefix) {
			let lines = self.lines;
			let limit = lines.size;
			let index = lines.findFirst { :each |
				each = prefix
			};
			index.isPositive.if {
				self.linesFromWhile(index + 1) { :each :unusedIndex |
					each.notEmpty
				}
			} {
				[]
			}
		}
	}

	references { :self |
		self.readParagraphField('References:')
	}

	seeAlso { :self |
		self.readCommaSeparatedField('See also: ')
	}

	signatures { :self |
		self.linesFromWhile(3) { :each :unusedIndex |
			each.beginsWith('- _')
		}
	}

	synopsis { :self |
		self.description.unlines.sentences.first
	}

	terseReferenceEntry { :self :options |
		let testCount = 0;
		let passCount = 0;
		options::verbose.ifTrue {
			(self.origin.fileNameWithoutExtensions, self.name).postLine
		};
		self.codeBlocks.do { :each |
			each::information.includesSubstring('methodDefinition').ifTrue {
				system.evaluate(each::contents)
			}
		};
		self.documentTests.do { :each |
			testCount := testCount + 1;
			options::verbose.ifTrue {
				('	' ++ each.format).postLine
			};
			each.evaluate.if {
				passCount := passCount + 1
			} {
				['Fail', each.format].postLine
			}
		};
		[testCount, passCount]
	}

	unicode { :self |
		self.readCommaSeparatedField('Unicode: ')
	}

}

+[String, URL] {

	HelpFile { :origin :source |
		newHelpFile().initializeSlots(origin, source, Record())
	}

}
