/* midiCps */
saw(line(24, 108, 10).midiCps) * 0.05

/* midiCps ; step */
saw(line(24, 108, 10).round(1).midiCps) * 0.05

/* midiCps ; requires=keywords */
saw(
	line(
		start: 24,
		end: 108,
		dur: 10
	).midiCps
) * 0.05

/* midiCps ; step ; requires=keywords */
saw(
	line(
		start: 24,
		end: 108,
		dur: 10
	).round(1).midiCps
) * 0.05
