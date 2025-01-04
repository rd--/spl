# helpFileName

- _helpFileName(aString)_

Answer the relative path to the Spl help file for the topic _aString_.

Topics that have no white space are reference files:

```
>>> 'SinOsc'.helpFileName
'Help/Reference/SinOsc.help.sl'
```

Topics that include white are guide files:

```
>>> 'Help Files'.helpFileName
'Help/Guide/Help Files.help.sl'
```

* * *

See also: HelpFile, splDirectory, splFile

Guides: Help Files
