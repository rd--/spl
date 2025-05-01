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

}
