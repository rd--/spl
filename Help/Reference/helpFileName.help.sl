# helpFileName

- _helpFileName(h, e='.sl')_

Answer the relative path to the Sᴘʟ help file for the help topic _h_.

Topics that have no white space are reference files:

```
>>> 'SinOsc'.helpFileName
'Help/Reference/SinOsc.help.sl'
```

Topics that include white space are guide files:

```
>>> 'Help Files'.helpFileName
'Help/Guide/Help Files.help.sl'
```

* * *

See also: HelpFile, splDirectory, splFileName

Guides: Help Files, Help Functions
