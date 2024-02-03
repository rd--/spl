# Preferences

Persistent system configuration.
A preferences files is loaded during system startup.
Preferences are stored in the system cache and can be accessed at `system.preferences`.

To read a preference, providing a default value in case it does not exist:

```
system.preference('ScSynth/Outputs/Main/NumberOfChannels', 2) = 2
```

Preferences can be assigned to:

```
system.preferences::Configuration := '1×2+1×8+2×4' = '1×2+1×8+2×4'
```

The default configuration is _Default_:

```
system.preferences::Configuration := 'Default' = 'Default'
```

By convention preferences are named using _PascalCase_.
The path separator is the _/_ character,
for instance _ScSynth/Outputs/Main/NumberOfChannels_.
