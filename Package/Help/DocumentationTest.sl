DocumentationTest : [Object, Equatable] { | prefix program expectedAnswer |

	evaluate { :self |
		{
			system.evaluate(self.format)
		}.ifError { :err |
			['DocumentationTest>>evaluate', err].postLine;
			false
		}
	}

	format { :self |
		(self.prefix = '>>>').if {
			'% ~ (%)'.format([
				self.program.unwords,
				self.expectedAnswer.unwords
			])
		} {
			(self.prefix = '>>').if {
				'{ % }.value.asString.equalIgnoringExtraWhitespace(%.utf8String)'.format([
					self.program.unwords,
					self.expectedAnswer.unlines.trim.utf8ByteArray.storeString
				])
			} {
				self.error('format: unknown prefix: ' ++ self.prefix)
			}
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	asDocumentationTest { :self |
		let prefix = RegularExpression('>+').match(self[1]);
		let program = self.select { :each |
			each.beginsWith(prefix)
		}.collect { :each |
			each.drop(prefix.size + 1)
		};
		let expectedAnswer = self.reject { :each |
			each.beginsWith(prefix)
		};
		DocumentationTest(prefix, program, expectedAnswer)
	}

	extractDocumentationTests { :self |
		let answer = [];
		let inBlock = false;
		let block = [];
		self.do { :currentLine |
			(
				currentLine.beginsWithAny(
					['>> ', '>>> ']
				) & {
					inBlock.not
				}
			).ifTrue {
				inBlock := true
			};
			(
				(
					currentLine.isEmpty | {
						currentLine.isCodeFence
					}
				) & {
					inBlock
				}
			).ifTrue {
				answer.add(block.asDocumentationTest);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(currentLine)
			}
		};
		answer
	}

}

+String {

	isDocumentationTestString { :self |
		self.beginsWith('>>')
	}

	DocumentationTest { :prefix :program :expectedAnswer |
		newDocumentationTest().initializeSlots(prefix, program, expectedAnswer)
	}

}
