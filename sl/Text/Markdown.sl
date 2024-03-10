+String {

	isCodeFence { :self |
		{- ['isCodeFence', self.beginsWith('~~~')].postLine; -}
		self.beginsWith('~~~') | {
			self.beginsWith('```')
		}
	}

	isTildeCodeFence { :self |
		self.beginsWith('~~~')
	}

	isGraveAccentCodeFence { :self |
		self.beginsWith('```')
	}

	parseMarkdownIndentedCodeBlocks { :self |
		let answer = [];
		let previous = '';
		let inBlock = false;
		let block = [];
		self.lines.do { :current |
			(current.notEmpty & {
				current.first.isTab & {
					previous.isEmpty & {
						inBlock.not
					}
				}
			}).ifTrue {
				inBlock := true
			};
			(current.isEmpty & {
				previous.notEmpty & {
					previous.first.isTab & {
						inBlock
					}
				}
			}).ifTrue {
				answer.add(block.copy);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(current)
			};
			previous := current
		};
		answer
	}

}
