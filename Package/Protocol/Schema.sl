+String {

	inferSchemaType { :self |
		[
			{ self.isBooleanString } -> 'Boolean',
			{ self.isDecimalIntegerString } -> 'Integer',
			{ self.isFractionString } -> 'Fraction',
			{ self.isComplexString } -> 'Complex',
			{ self.isFloatString } -> 'Real',
			{ self.isDateString } -> 'Date',
			{ self.isDateAndTimeString } -> 'DateAndTime',
			{ self.isDurationString } -> 'Duration',
			{ self.isTimeString } -> 'Time',
			true -> 'String'
		].which
	}

	parseSchemaType { :self :schemaType |
		schemaType.caseOfOtherwise(
			[
				'Boolean' -> { self.parseBoolean },
				'Integer' -> { self.parseDecimalInteger },
				'Fraction' -> { self.parseFraction },
				'Complex' -> { self.parseComplex },
				'Real' -> { self.parseNumber },
				'Date' -> { self.parseDate },
				'DateAndTime' -> { self.parseDateAndTime },
				'Duration' -> { self.parseDuration },
				'Time' -> { self.parseTime },
				'String' -> { self }
			]
		) {
			self.error('parseSchemeType: unknown type')
		}
	}

	schemaTypePredicate { :self |
		self.caseOfOtherwise(
			[
				'Boolean' -> { isBoolean:/1 },
				'Integer' -> { isInteger:/1 },
				'Fraction' -> { isFraction:/1 },
				'Complex' -> { isComplex:/1 },
				'Real' -> { isSmallFloat:/1 },
				'Date' -> { isDate:/1 },
				'DateAndTime' -> { isDateAndTime:/1 },
				'Duration' -> { isDuration:/1 },
				'Time' -> { isTime:/1 },
				'String' -> { isString:/1 }
			]
		) {
			self.error('schemaTypePredicate: unknown type')
		}
	}

}

+@Object {

	isSchemaType { :self :schemaType |
		schemaType.schemaTypePredicate.value(self)
	}

}
