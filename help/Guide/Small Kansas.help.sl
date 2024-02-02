# Small Kansas

Small Kansas is an experimental graphical interface for the experimental _[Simple Programming Language]_.

It includes a library for communicating with the _SuperCollider_ synthesiser.

To play a synthesiser program open the _WorldMenu_ and from there open the _ProgramBrowser_.

Navigate to a program, then open the context menu of the _TextEditor_ and select 'Play It (Enter)'.

To reset the synthesiser select 'Reset Synthesiser (.)'.

To get help about a word, for instance _SinOscFb_, select 'Help For It (h)'.

To see the implementations of a word, for instance _playEvery_, select 'Implementors Of It (m)'.

Text in brackets, for instance _[Fraction Literals]_, indicates that the bracketed text is the name of a help document,
which can be visited the same way.

Ordinarily an internal copy of the SuperCollider synthesiser is used,
which is started as required,
however the system can also connect to an existing external instance of the synthesiser,
see the _ScSynth_ help file.
