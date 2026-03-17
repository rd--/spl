/* Requires: Cache */

+Record {

	codeBlockImageIdentifier { :codeBlock |
		codeBlock['attributes'][codeBlock.codeBlockImageType]
	}

	codeBlockImageType { :codeBlock |
		let attributes = codeBlock['attributes'];
		['png' 'svg'].detect { :each |
			attributes.includesKey(each)
		}
	}

	codeBlockIsImage { :codeBlock |
		let attributes = codeBlock['attributes'];
		['png' 'svg'].anySatisfy { :each |
			attributes.includesKey(each)
		}
	}

}

HelpFile : [Object, Equatable, Cache] { | origin source cache |

	categories { :self |
		self.readCommaSeparatedField('Categories: ')
	}

	codeBlocks { :self |
		self.cached('codeBlocks') {
			self.markdown.codeBlocks.collect { :each |
				let information = each['information'];
				information.isEmpty.if {
					each['attributes'] := (:)
				} {
					each['attributes'] := information.parseUnquotedAttributeList
				};
				each
			}
		}
	}

	codeBlockImageFileName { :self :codeBlock |
		system.splFileName(
			'Help/Image/%-%.%'.format(
				[
					self.originName,
					codeBlock.codeBlockImageIdentifier,
					codeBlock.codeBlockImageType
				]
			)
		)
	}

	codeBlocksWithAttribute { :self :key :value |
		self.codeBlocks.select { :each |
			each['attributes'].includesAssociation(key -> value)
		}
	}

	codeBlocksWithKey { :self :key |
		self.codeBlocks.select { :each |
			each['attributes'].includesKey(key)
		}
	}

	definitionCodeBlocks { :self |
		self.codeBlocksWithKey('define')
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

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isHelp & {
			self.equalByAtNamedSlots(
				anObject,
				['origin' 'source'],
				aBlock:/2
			)
		}
	}

	evaluateDefinitionCodeBlocks { :self |
		self.codeBlocksWithKey('define').do { :each |
			system.evaluate(each['contents'])
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

	guides { :self |
		self.readCommaSeparatedField('Guides: ')
	}

	hasDocumentationTests { :self |
		self.documentationTests.isNotEmpty
	}

	hasRationale { :self |
		self.rationale.isNotEmpty
	}

	hasReferences { :self |
		self.references.isNotEmpty
	}

	hasSignatures { :self |
		self.signatures.isNotEmpty
	}

	hasUnicode { :self |
		self.unicode.isNotEmpty
	}

	helpPrograms { :self |
		let paragraphs = self.paragraphs;
		let topic = self.originName;
		let language = 'spl';
		paragraphs.detectIndices { :each |
			each.beginsWith('~~~spl')
		}.collect { :i |
			let commentary = paragraphs[i - 1];
			let codeBlock = paragraphs[i].lines;
			let annotations = codeBlock[1].allButFirst(6).parseUnquotedAttributeList;
			let programText = codeBlock.allButFirstAndLast.unlines;
			HelpProgram(topic, language, commentary, annotations, programText)
		}
	}

	imageCodeBlocks { :self |
		self.codeBlocks.select(codeBlockIsImage:/1)
	}

	imageHelpPrograms { :self |
		self.helpPrograms.select(isImageProgram:/1)
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

	oeisHelpPrograms { :self |
		self.helpPrograms.select(isOeisProgram:/1)
	}

	oeisReferences { :self |
		self.lines
		.collect { :s |
			s.matchRegularExpression('oeis.org/A[0-9]+')
		}.deleteMissing
		.collect { :s |
			s.last(7)
		}.lexicographicSort
		.nub
	}

	originName { :self |
		self.origin.fileNameWithoutExtensions.decodeUri
	}

	paragraphFrom { :self :index |
		self.linesFromWhile(index) { :each :unusedIndex |
			each.isNotEmpty
		}
	}

	paragraphs { :self |
		self.cached('paragraphs') {
			self.source.paragraphs
		}
	}

	/*
	properName { :self |
		self.isReferenceFile.if {
			let firstWord = self.name.words.first;
			firstWord.isSplOperatorName.if {
				firstWord.splOperatorTokenName
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
					each.isNotEmpty
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
			self.evaluateDefinitionCodeBlocks;
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
		self.writePngImageFiles;
		self.writeSvgImageFiles
	}

	writePngImageFiles { :self |
		self.evaluateDefinitionCodeBlocks;
		self.codeBlocksWithKey('png').do { :each |
			let fileName = self.codeBlockImageFileName(each);
			fileName.postLine;
			system.evaluate(each['contents']).writePng(fileName)
		}
	}

	writeSvgImageFiles { :self |
		self.evaluateDefinitionCodeBlocks;
		self.codeBlocksWithKey('svg').do { :each |
			let fileName = self.codeBlockImageFileName(each);
			fileName.postLine;
			system.evaluate(each['contents']).drawing.writeSvg(fileName)
		}
	}

}

+[String, URL] {

	HelpFile { :origin :source |
		newHelpFile().initializeSlots(origin, source, Record())
	}

}

+String {

	helpFileName { :topic :extension |
		'Help/%/%.help%'.format(
			[
				topic.includes(' ').if {
					'Guide'
				} {
					'Reference'
				},
				topic,
				extension
			]
		)
	}

	helpFileName { :topic |
		topic.helpFileName('.sl')
	}

}

+System {

	helpFiles { :self :kind |
		self.cached('helpFiles' ++ kind) {
			let answer = [];
			self.helpFilesDo(
				kind, '.*', false
			) { :each |
				answer.add(each)
			};
			answer
		}
	}

	helpFilesDo { :self :kind :pattern :verbose :aBlock:/1 |
		let directoryName = self.splFileName('Help/' ++ kind);
		self
		.readDirectoryFileNames(directoryName)
		.sort
		.select { :each |
			each.endsWith('.help.sl') & {
				each.pathBasename.matchesRegularExpression(pattern)
			}
		}.do { :each |
			let text = system.readTextFile(each);
			let help = HelpFile(
				each.asFileUrl,
				text
			);
			verbose.ifTrue {
				each.postLine
			};
			aBlock(help)
		}
	}

	helpImageIndex { :self |
		[
			'# Help Image Index',
			''
		] ++ self.helpProgramDictionary(
			isImageProgram:/1
		).keysAndValuesCollect { :n :e |
			[
				'- `%`'.format([n])
			] ++ e.withIndexCollect { :p :i |
				[n, e.size, i].postLine;
				'  %. ![](sw/spl/Help/Image/%)'
				.format(
					[
						i,
						p.imageFileName
					]
				)
			}
		}.values.catenate
	}

	helpProgramDictionary { :self |
		self.cached('helpProgramDictionary') {
			let answer = (:);
			self.helpFiles('Reference').do { :each |
				let p = each.helpPrograms;
				p.ifNotEmpty {
					answer.add(each.originName -> p)
				}
			};
			answer
		}
	}

	helpProgramDictionary { :self :aBlock:/1 |
		self.helpProgramDictionary.collect { :each |
			each.select(aBlock:/1)
		}.select(isNotEmpty:/1)
	}

	helpProgramTable { :self |
		self.cached('helpProgramTable') {
			self.helpProgramDictionary.keysAndEachValue
		}
	}

	helpProgramTable { :self :aBlock:/1 |
		self.helpProgramTable.select { :each |
			aBlock(each[2])
		}
	}

	helpProgramsDo { :self :aBlock:/1 |
		self.helpFiles('Reference').do { :helpFile |
			helpFile.helpPrograms.do(aBlock:/1)
		}
	}

	helpProgramsSelect { :self :aBlock:/1 |
		let answer = [];
		self.helpProgramsDo { :each |
			aBlock(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	readHelpFile { :self :topic |
		let fileName = self.splFileName(
			topic.helpFileName
		);
		HelpFile(
			fileName.asFileUrl,
			self.readTextFile(fileName)
		)
	}

	referenceHelpFilesDo { :self :pattern :aBlock:/1 |
		self.helpFilesDo('Reference', pattern, aBlock:/1)
	}

}

+String {

	helpFragment { :topic :key :value |
		let helpFile = system.readHelpFile(topic);
		let [codeBlock] = helpFile.codeBlocksWithAttribute(key, value);
		codeBlock.at('contents')
	}

	helpFragment { :topic :key :value :indices |
		let helpFile = system.readHelpFile(topic);
		let paragraphs = helpFile.paragraphs;
		let prefix = '~~~spl %=%'.format([key, value]);
		let index = paragraphs.detectIndex { :each |
			each.beginsWith(prefix)
		};
		let codeFragment = paragraphs[index].lines.allButFirstAndLast;
		[
			paragraphs.atAll(index + indices),
			codeFragment.unlines
		]
	}

	helpFragmentPreprocessor { :inputText |
		inputText.lines.collect { :line |
			line.beginsWith('<<<').if {
				let [a, b, c] = line.drop(3).splitBy(',');
				let [d, e] = helpFragment(a, b, c, [-1, 1]);
				[
					d[1],
					'',
					'~~~',
					e.withoutTrailingBlanks,
					'~~~',
					'',
					d[2]
				].unlines
			} {
				line
			}
		}.unlines
	}

	helpFilePreprocessor { :topic |
		let inputFilePath = topic.helpFileName('.pre').splFilePath;
		inputFilePath.helpFragmentPreprocessor
	}

}

+FilePath {

	helpFragmentPreprocessor { :inputFilePath :outputFilePath |
		let inputText = inputFilePath.readTextFile;
		let outputText = inputText.helpFragmentPreprocessor;
		outputFilePath.writeTextFile(outputText)
	}

	helpFragmentPreprocessor { :inputFilePath |
		let inputText = inputFilePath.readTextFile;
		let outputFilePath = inputFilePath.replaceExtension('.pre', '.sl');
		inputFilePath.helpFragmentPreprocessor(outputFilePath)
	}

}
