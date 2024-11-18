/* Requires: DocumentTest, FileSystem, Url */

+String {

	terseReferenceSummary { :directoryName |
		directoryName.terseReferenceSummary(verbose: false)
	}

	terseReferenceSummary { :directoryName :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let fileNameList = directoryName.readDirectoryFileNames;
		let helpFileNameList = fileNameList.sort.select { :each |
			each.endsWith('.help.sl')
		};
		let textList = helpFileNameList.readTextFileList;
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
