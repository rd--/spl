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

	parseSchemaType { :self :schemaType :elseClause:/0 |
		schemaType.caseOfOtherwise(
			[
				'Boolean' -> { self.parseBoolean(elseClause:/0) },
				'Integer' -> { self.parseDecimalInteger(elseClause:/0) },
				'Fraction' -> { self.parseFraction(elseClause:/0) },
				'Complex' -> { self.parseComplex(elseClause:/0) },
				'Real' -> { self.parseNumber(elseClause:/0) },
				'Date' -> { self.parseDate(elseClause:/0) },
				'DateAndTime' -> { self.parseDateAndTime(elseClause:/0) },
				'Duration' -> { self.parseDuration(elseClause:/0) },
				'Time' -> { self.parseTime(elseClause:/0) },
				'String' -> { self }
			]
		) {
			elseClause()
		}
	}

	parseSchemaType { :self :schemaType |
		self.parseSchemaType(schemaType) {
			self.error('parseSchemeType: unknown type or invalid input')
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
