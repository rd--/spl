# Small Kansas

Small Kansas is an experimental graphical interface for the experimental `Simple Programming Language`.

It includes a library for communicating with the _SuperCollider_ synthesiser.

To play a synthesiser program open the `WorldMenu` and from there open the `ProgramBrowser`.

Navigate to a program, then open the context menu of the `TextEditor` and select 'Play It (Enter)'.

To reset the synthesiser select 'Reset Synthesiser (.)'.

To get help about a word, for instance `SinOscFb`, select 'Help For It (h)'.

To see the implementations of a word, for instance `playEvery`, select 'Implementors Of It (m)'.

Text in back-ticks, for instance `Fraction Syntax`, indicates that the bracketed text is the name of a help document,
which can be visited the same way.

Ordinarily an internal copy of the SuperCollider synthesiser is used,
which is started as required,
however the system can also connect to an existing external instance of the synthesiser,
see the `ScSynth` help file.
