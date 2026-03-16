HelpProgram : [Object] { | topic language commentary annotations programText |

	fencedCodeBlock { :self |
		[
			'~~~spl',
			self.programText,
			'~~~'
		].unlines
	}

	imageFileName { :self |
		'%-%.%'.format(
			[
				self.topic,
				self.imageIdentifier,
				self.imageType
			]
		)
	}

	imageIdentifier { :self |
		self.annotations.at(self.imageType)
	}

	imageType { :self |
		['png' 'svg'].detect { :each |
			self.annotations.includesKey(each)
		}
	}

	isDefinitionProgram { :self |
		self.annotations.includesKey('define')
	}

	isImageProgram { :self |
		['png' 'svg'].anySatisfy { :each |
			self.annotations.includesKey(each)
		}
	}

	isOeisProgram { :self |
		self.annotations.includesKey('oeis')
	}

}

+String {

	HelpProgram { :topic :language :commentary :annotations :programText |
		newHelpProgram()
		.initializeSlots(topic, language, commentary, annotations, programText)
	}

}
