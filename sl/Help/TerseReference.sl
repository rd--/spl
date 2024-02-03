{- Requires: Url -}

+String {

	terseReferenceSummary { :self |
		self.terseReferenceSummary(verbose: false)
	}

	terseReferenceSummary { :directoryName :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		directoryName.readDirectoryFileNames.then { :fileNameArray |
			let selectedFileNameArray = [];
			fileNameArray.size.postLine;
			fileNameArray.sorted.do { :fileName |
				let pathArray = fileName.splitBy('/');
				pathArray.last.first.isLowerCaseAscii.ifTrue {
					selectedFileNameArray.add(fileName)
				}
			};
			selectedFileNameArray.readTextFileArray.then { :referenceTextArray |
				referenceTextArray.withIndexDo { :referenceText :index |
					let [testCount, passCount] = referenceText.terseReferenceEntry(options);
					(testCount > 0).and {
						testCount ~= passCount
					}.ifTrue {
						selectedFileNameArray[index].postLine;
						['Failure', testCount, passCount].postLine
					};
					totalTestCount := totalTestCount + testCount;
					totalPassCount := totalPassCount + passCount
				};
				['Terse Reference Summary', totalTestCount, totalPassCount].postLine
			}
		}
	}

	terseReferenceEntry { :self :options |
		let testCount = 0;
		let passCount = 0;
		self.extractIndentedCodeBlocks.concatenation.do { :each |
			testCount := testCount + 1;
			options::verbose.ifTrue {
				each.postLine
			};
			system.evaluate(each).if {
				passCount := passCount + 1
			} {
				['Fail', each].postLine
			}
		};
		[testCount, passCount]
	}

}
