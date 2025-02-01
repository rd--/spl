/* Requires: DocumentationTest FileSystem Url */

+String {

	terseReferenceSummaryDo { :directoryName :options :testName :aBlock:/2 |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let fileNameList = directoryName.readDirectoryFileNames;
		let helpFileNameList = fileNameList.sort.select { :each |
			each.endsWith('.help.sl') & {
				each.pathBasename.matchesRegExp(options['pattern'])
			}
		};
		let textList = helpFileNameList.readTextFileList;
		textList.withIndexDo { :text :index |
			let fileName = helpFileNameList[index];
			let helpFile = HelpFile(fileName.asFileUrl, text);
			let [testCount, passCount] = aBlock(helpFile, options);
			options['verbose'].ifTrue {
				(helpFile.originName, helpFile.name).postLine;
				'	Pass % of %'.format([passCount, testCount]).postLine
			};
			totalTestCount := totalTestCount + testCount;
			totalPassCount := totalPassCount + passCount
		};
		'Terse Reference Summary: %: Pass % of %'.format([testName, totalPassCount, totalTestCount]).postLine
	}

	terseReferenceSummary { :directoryName :options |
		directoryName.terseReferenceSummaryDo(options, 'Documentation Tests', terseReferenceEntry:/2)
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
			[testCount, passCount]
		}
	}

}
