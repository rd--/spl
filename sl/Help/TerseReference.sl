{- Requires: Url -}

+String {

	parseTerseDocumentTestBlocks { :self |
		let answer = [];
		let inBlock = false;
		let block = [];
		self.lines.do { :currentLine |
			(
				currentLine.beginsWith('>>> ') & {
					inBlock.not
				}
			).ifTrue {
				inBlock := true
			};
			(
				(
					currentLine.isEmpty | {
						currentLine.beginsWith('```')
					}
				) & {
					inBlock
				}
			).ifTrue {
				answer.add(block.copy);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(currentLine)
			}
		};
		answer
	}

	terseReferenceEntry { :self :name :options |
		let testCount = 0;
		let passCount = 0;
		options::verbose.ifTrue {
			name.postLine
		};
		self.parseTerseDocumentTestBlocks.do { :each |
			let test = each.formatTerseDocumentTestEntry;
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

+List {

	formatTerseDocumentTestEntry { :self |
		let lhs = self.allButLast.collect { :each |
			each.drop(4)
		}.unwords;
		let rhs = self.last;
		lhs ++ ' ~ (' ++ rhs ++ ')'
	}

}
