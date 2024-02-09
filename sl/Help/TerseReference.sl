{- Requires: Url -}

+String {

	parseTerseDoctestBlocks { :self |
		let answer = [];
		let inBlock = false;
		let block = [];
		self.lines.do { :current |
			(current.beginsWith('>>> ') & {
				inBlock.not
			}).ifTrue {
				inBlock := true
			};
			((current.isEmpty | { current.beginsWith('```') }) & {
				inBlock
			}).ifTrue {
				answer.add(block.copy);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(current)
			}
		};
		answer
	}

	terseReferenceSummary { :self |
		self.terseReferenceSummary(verbose: false)
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

	terseReferenceEntry { :self :name :options |
		let testCount = 0;
		let passCount = 0;
		options::verbose.ifTrue {
			name.postLine
		};
		self.parseMarkdownIndentedCodeBlocks.concatenation.do { :each |
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
		self.parseTerseDoctestBlocks.do { :each |
			let test = each.formatTerseDoctestEntry;
			testCount := testCount + 1;
			options::verbose.ifTrue {
				('	' ++ test).postLine
			};
			system.evaluate(test).if {
				passCount := passCount + 1
			} {
				['Fail', each].postLine
			}
		};
		[testCount, passCount]
	}

}

+List {

	formatTerseDoctestEntry { :self |
		let lhs = self.allButLast.collect { :each |
			each.drop(4)
		}.unwords;
		let rhs = self.last;
		lhs ++ ' ~ ' ++ rhs
	}

}
