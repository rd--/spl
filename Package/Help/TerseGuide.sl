/* Requires: Url */

+String {

	terseGuideSummary { :self :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let areas = self.paragraphs;
		let verboseLevel = options.at('verboseLevel');
		'Terse Guide Summary: Areas = %'.format([areas.size]).printLine;
		areas.do { :area |
			let entries = area.lines.reject { :line |
				line.isEmpty | {
					line = '```'
				}
			};
			let testCount = entries.size - 1;
			let failCount = 0;
			let passCount = 0;
			(verboseLevel > 0).ifTrue {
				entries[1].printLine
			};
			2.toCollect(testCount + 1) { :index |
				let test = entries[index];
				(verboseLevel > 1).ifTrue {
					test.printLine
				};
				(system.evaluate(test) = true).if {
					passCount := passCount + 1
				} {
					failCount := failCount + 1;
					('	Error: ' ++ test).printLine
				}
			};
			totalTestCount := totalTestCount + testCount;
			totalPassCount := totalPassCount + passCount;
			(verboseLevel > 0).ifTrue {
				[
					'	=> ',
					passCount, ' / ', testCount,
					(failCount > 0).if {
						' (% Failures)'.format([failCount])
					} {
						''
					}
				].stringJoin.printLine
			}
		};
		'Total => % / %'.format([totalPassCount, totalTestCount]).printLine
	}

}

+@Url {

	terseGuideSummary { :self :options |
		Url(self).fetchText.then { :text |
			text.terseGuideSummary(options)
		}
	}

}
