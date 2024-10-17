/* Requires: DocumentTest, Url */

+String {

	terseReferenceSummary { :directoryName |
		directoryName.terseReferenceSummary(verbose: false)
	}

	terseReferenceSummary { :directoryName :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		directoryName.readDirectoryFileNames.then { :fileNameList |
			let helpFileNameList = fileNameList.sort.select { :each |
				each.endsWith('.help.sl')
			};
			helpFileNameList.readTextFileList.then { :textList |
				textList.withIndexDo { :text :index |
					let fileName = helpFileNameList[index];
					let helpFile = HelpFile(fileName.asFileUrl, text);
					let [testCount, passCount] = helpFile.terseReferenceEntry(options);
					(
						testCount > 0 & {
							testCount ~= passCount
						}
					).ifTrue {
						fileName.postLine;
						['Failure', testCount, passCount].postLine
					};
					totalTestCount := totalTestCount + testCount;
					totalPassCount := totalPassCount + passCount
				};
				['Terse Reference Summary', totalTestCount, totalPassCount].postLine
			}
		}
	}

}
