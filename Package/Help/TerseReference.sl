/* Requires: DocumentationTest FileSystem Url */

+FilePath {

	terseProgramSummary { :directoryName :answerPredicate:/1 |
		let testCount = 0;
		let passCount = 0;
		let errorCount = 0;
		directoryName
		.readDirectoryFileNames
		.do { :fileName |
			let fileText = fileName.readTextFile;
			let programTexts = fileText.paragraphs.takeWhile { :each |
				each.beginsWith('#').not
			};
			[fileName, programTexts.size].postLine;
			programTexts.do { :each |
				let result = system.evaluate(each);
				testCount := testCount + 1;
				result.answerPredicate.if {
					passCount := passCount + 1
				} {
					['FAIL', each].postLine
				}
			}
		};
		[testCount, passCount, errorCount].postLine
	}

	terseReferenceSummaryDo { :directoryName :options :testName :aBlock:/2 |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let totalErrorCount = 0;
		let fileNameList = system.readDirectoryFileNames(directoryName.absolutePathString);
		let helpFileNameList = fileNameList.sortBy(<|).select { :each |
			each.endsWith('.help.sl') & {
				each.pathBasename.matchesRegularExpression(options['pattern'])
			}
		};
		let textList = system.readTextFileList(helpFileNameList);
		textList.withIndexDo { :text :index |
			let fileName = helpFileNameList[index];
			let helpFile = HelpFile(fileName.asFileUrl, text);
			let [testCount, passCount, errorCount] = {
				options['verbose'].ifTrue {
					(helpFile.originName, helpFile.name).postLine
				};
				aBlock(helpFile, options)
			}.value;
			options['verbose'].ifTrue {
				'	Pass % of %'.format([passCount, testCount]).postLine
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
		).postLine
	}

	terseReferenceSummary { :directoryName :options |
		directoryName.terseReferenceSummaryDo(
			options,
			'Documentation Tests',
			terseReferenceEntry:/2
		)
	}

	terseSuperColliderGraphSummary { :directoryName :options |
		directoryName.terseReferenceSummaryDo(options, 'SuperCollider Graph Tests') { :helpFile :options |
			let testCount = 0;
			let passCount = 0;
			let scGraphCodeBlocks = helpFile.unspecifiedCodeBlocks;
			scGraphCodeBlocks.isEmpty.ifFalse {
				let verbose = options['verbose'];
				verbose.ifTrue {
					helpFile.name.postLine
				};
				scGraphCodeBlocks.do { :x |
					let programText = x['contents'];
					let result = system.evaluate(programText);
					testCount := testCount + 1;
					result.isOutputSignal.if {
						passCount := passCount + 1
					} {
						'	FAIL: %s: %s'.format([helpFile.name, programText]).postLine
					}
				}
			};
			[testCount, passCount, 0]
		}
	}

}
