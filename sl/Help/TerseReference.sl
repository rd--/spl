{- Requires: Url -}

+String {

	terseReferenceDirectorySummary { :directoryName :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		directoryName.readDirectoryFileNames.then { :fileNameArray |
			let selectedFileNameArray = [];
			fileNameArray.size.postLine;
			fileNameArray.sorted.do { :fileName |
				let pathArray = fileName.splitBy('/');
				let leadingCodePoint = pathArray.last.first.codePoint;
				((leadingCodePoint >= 97) && (leadingCodePoint <= 99)).ifTrue {
					selectedFileNameArray.add(fileName)
				}
			};
			selectedFileNameArray.readTextFileArray.then { :referenceTextArray |
				referenceTextArray.withIndexDo { :referenceText :index |
					| testCount passCount |
					selectedFileNameArray[index].postLine;
					[testCount, passCount] := referenceText.terseReferenceSummary(options);
					[testCount, passCount].postLine;
					totalTestCount := totalTestCount + testCount;
					totalPassCount := totalPassCount + passCount
				};
				[totalTestCount, totalPassCount].postLine
			}
		}
	}

	terseReferenceSummary { :self |
		self.terseReferenceSummary(verbose: false)
	}

	terseReferenceSummary { :self :options |
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

+@Url {

	terseReferenceSummary { :self :options |
		self.asUrl.fetchText {
			self.error('terseReferenceSummary: fetch failed')
		}.then { :text |
			text.terseReferenceSummary(options)
		}
	}

}
