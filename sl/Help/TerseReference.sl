/* Requires: DocumentationTest FileSystem Url */

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
			(helpFile.documentationTests.size > 0).ifTrue {
				let [testCount, passCount] = helpFile.terseReferenceEntry(options);
				totalTestCount := totalTestCount + testCount;
				totalPassCount := totalPassCount + passCount
			}
		};
		'Terse Reference Summary: Pass % of %'.format([totalPassCount, totalTestCount]).postLine
	}

}
