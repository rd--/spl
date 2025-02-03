/* Requires: Cache */

HelpFile : [Object, Cache] { | origin source cache |

	= { :self :anObject |
		anObject.isHelp & {
			self.equalByAtNamedSlots(
				anObject,
				['origin' 'source'],
				=
			)
		}
	}

	categories { :self |
		self.readCommaSeparatedField('Categories: ')
	}

	codeBlocks { :self |
		self.cached('codeBlocks') {
			self.markdown.codeBlocks.collect { :each |
				let information = each['information'];
				information.isEmpty.if {
					each['attributes'] := ()
				} {
					each['attributes'] := information.words.collect { :each |
						let parts = each.splitBy('=');
						parts[1] -> (parts.size = 1).if {
							'true'
						} {
							parts[2]
						}
					}.asRecord
				};
				each
			}
		}
	}

	codeBlocksWithAttribute { :self :key |
		self.codeBlocks.select { :each |
			each['attributes'].includesKey(key)
		}
	}

	codeBlockImageFileName { :self :codeBlock :imageType |
		let imageIdentifier = codeBlock['attributes'][imageType];
		system.splFile(
			'Help/Image/%-%.%'.format(
				[
					self.originName,
					imageIdentifier,
					imageType
				]
			)
		)
	}

	codeBlockImageType { :self :codeBlock |
		let attributes = codeBlock['attributes'];
		['png' 'svg'].detect { :each |
			attributes.includesKey(each)
		}
	}

	definitionCodeBlocks { :self |
		self.codeBlocks.select { :each |
			each['attributes'].includesKey('define')
		}
	}

	description { :self |
		let index = 3;
		self.hasSignatures.ifTrue {
			index := index + self.signatures.size + 1
		};
		self.paragraphFrom(index)
	}

	documentationTests { :self |
		self.cached('documentationTests') {
			self.lines.extractDocumentationTests
		}
	}

	extractDocumentationTests { :self |
		self.lines.extractDocumentationTests
	}

	fencedCodeBlockLineRanges { :self |
		let answer = [];
		self.markdown.do { :each |
			(each['type'] = 'codeBlock').ifTrue {
				let [start, end] = each['sourcePosition'];
				self.lines[start[1]].isCodeFence.ifTrue {
					answer.add(Range(start[1], end[1], 1))
				}
			}
		};
		answer
	}

	hasDocumentationTests { :self |
		self.documentationTests.notEmpty
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

	isGuideFile { :self |
		self.origin.pathName.includesSubstring('Help/Guide')
	}

	isReferenceFile { :self |
		self.origin.pathName.includesSubstring('Help/Reference')
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
				self.error('HelpFile>>name: ' ++ entry)
			}
		}
	}

	originName { :self |
		self.origin.fileNameWithoutExtensions.decodeUri
	}

	paragraphFrom { :self :index |
		self.linesFromWhile(index) { :each :unusedIndex |
			each.notEmpty
		}
	}

	/*
	properName { :self |
		self.isReferenceFile.if {
			let firstWord = self.name.words.first;
			firstWord.isOperatorName.if {
				firstWord.operatorTokenName
			} {
				firstWord
			}
		} {
			self.name
		}
	}
	*/

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
		let errorCount = 0;
		(self.documentationTests.size > 0).ifTrue {
			let verbose = options['verbose'];
			self.codeBlocks.do { :each |
				each['attributes'].includesKey('define').ifTrue {
					system.evaluate(each['contents'])
				}
			};
			self.documentationTests.do { :each |
				testCount := testCount + 1;
				verbose.ifTrue {
					('	' ++ each.format).postLine
				};
				{
					each.evaluate
				}.ifError {
					('	ERROR: ' ++ each.format).postLine;
					errorCount := errorCount + 1;
					false
				}.if {
					passCount := passCount + 1
				} {
					('	FAIL: ' ++ each.format).postLine
				}
			}
		};
		[testCount, passCount, errorCount]
	}

	unicode { :self |
		self.readCommaSeparatedField('Unicode: ')
	}

	unspecifiedCodeBlocks { :self |
		self.codeBlocks.reject { :each |
			each['contents'].isDocumentationTestString | {
				each['attributes'].isEmpty.not
			}
		}
	}

	writeImageFiles { :self |
		let verbose = false;
		verbose.ifTrue {
			['writeImageFiles', self.name].postLine
		};
		self.definitionCodeBlocks.do { :each |
			system.evaluate(each['contents'])
		};
		self.codeBlocksWithAttribute('png').do { :each |
			let fileName = self.codeBlockImageFileName(each, 'png');
			fileName.postLine;
			system.evaluate(each['contents']).writePng(fileName)
		};
		self.codeBlocksWithAttribute('svg').do { :each |
			let fileName = self.codeBlockImageFileName(each, 'svg');
			fileName.postLine;
			system.evaluate(each['contents']).writeSvg(fileName)
		}
	}

}

+[String, URL] {

	HelpFile { :origin :source |
		newHelpFile().initializeSlots(origin, source, Record())
	}

}

+String {

	helpFileName { :topic |
		'Help/%/%.help.sl'.format([
			topic.includes(' ').if {
				'Guide'
			} {
				'Reference'
			},
			topic
		])
	}

}

+System {

	helpFilesDo { :self :kind :aBlock:/1 |
		self
		.splFile('Help/' ++ kind)
		.readDirectoryFileNames
		.select { :each |
			each.endsWith('.help.sl')
		}.do { :each |
			let text = each.readTextFile;
			let help = HelpFile(
				each.asFileUrl,
				text
			);
			aBlock(help)
		}
	}

	referenceHelpFilesDo { :self :aBlock:/1 |
		self.helpFilesDo('Reference', aBlock:/1)
	}

}
