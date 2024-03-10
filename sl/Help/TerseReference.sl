{- Requires: DocumentTest, Url -}

+String {

	terseReferenceEntry { :self :name :options |
		let testCount = 0;
		let passCount = 0;
		options::verbose.ifTrue {
			name.postLine
		};
		self.lines.extractDocumentTests.do { :each |
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

	terseReferenceSummary { :directoryName |
		directoryName.terseReferenceSummary(verbose: false)
	}

	terseReferenceSummary { :directoryName :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		directoryName.readDirectoryFileNames.then { :fileNameList |
			fileNameList.sort;
			fileNameList.readTextFileList.then { :textList |
				textList.withIndexDo { :text :index |
					let [testCount, passCount] = text.terseReferenceEntry(fileNameList[index], options);
					(testCount > 0 & {
						testCount ~= passCount
					}).ifTrue {
						fileNameList[index].postLine;
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
