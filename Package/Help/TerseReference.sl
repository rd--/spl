/* Requires: DocumentationTest FileSystem Url */

+FilePath {

	terseProgramSummary { :directoryName :answerPredicate/1 |
		let testCount = 0;
		let passCount = 0;
		let errorCount = 0;
		directoryName
		.readDirectoryFileNames
		.do { :fileName |
			let fileText = fileName.readTextFile;
			let programTexts = fileText.paragraphs.takeWhile { :each |
				each.includesSubstring('Notes').not
			};
			[fileName, programTexts.size].printLine;
			programTexts.do { :each |
				let result = system.evaluate(each);
				result.concisePrintString;
				testCount := testCount + 1;
				result.answerPredicate.if {
					passCount := passCount + 1
				} {
					['FAIL', each].printLine
				}
			}
		};
		[testCount, passCount, errorCount].printLine
	}

	terseReferenceSummary { :directoryName :options |
		directoryName.terseReferenceSummaryDo(
			options,
			'Documentation Tests',
			terseReferenceEntry/2
		)
	}

	terseReferenceSummaryDo { :directoryName :options :testName :aBlock/2 |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let totalErrorCount = 0;
		let verboseLevel = options['verboseLevel'];
		let fileNameList = system.readDirectoryFileNames(directoryName.absolutePathString);
		let helpFileNameList = fileNameList.sortBy!(precedes/2).select { :each |
			each.endsWith('.help.sl') & {
				each.pathBaseName.matchesRegularExpression(options['pattern'])
			}
		};
		let textList = system.readTextFileList(helpFileNameList);
		textList.withIndexDo { :text :index |
			let fileName = helpFileNameList[index];
			let helpFile = HelpFile(fileName.fileUrl, text);
			(verboseLevel > 0).ifTrue {
				(helpFile.originName, helpFile.name).printLine
			};
			let [testCount, passCount, errorCount] = aBlock(helpFile, options);
			(verboseLevel > 0).ifTrue {
				'	Pass % of %'.format([passCount, testCount]).printLine
			};
			totalTestCount := totalTestCount + testCount;
			totalPassCount := totalPassCount + passCount;
			totalErrorCount := totalErrorCount + errorCount
		};
		'Terse Reference Summary: %: Pass % of % (% Error)'.format(
			[
				testName,
				totalPassCount,
				totalTestCount,
				totalErrorCount
			]
		).printLine
	}

	terseSuperColliderGraphSummary { :directoryName :options |
		directoryName.terseReferenceSummaryDo(
			options,
			'SuperCollider Graph Tests'
		) { :helpFile :options |
			let testCount = 0;
			let passCount = 0;
			let scGraphCodeBlocks = helpFile.unspecifiedCodeBlocks;
			scGraphCodeBlocks.isEmpty.ifFalse {
				let verboseLevel = options['verboseLevel'];
				(verboseLevel > 0).ifTrue {
					helpFile.name.printLine
				};
				scGraphCodeBlocks.do { :x |
					let programText = x['contents'];
					let result = system.evaluate(programText);
					testCount := testCount + 1;
					result.isOutputSignal.if {
						passCount := passCount + 1
					} {
						'	FAIL: %s: %s'.format(
							[
								helpFile.name,
								programText
							]
						).printLine
					}
				}
			};
			[testCount, passCount, 0]
		}
	}

}
