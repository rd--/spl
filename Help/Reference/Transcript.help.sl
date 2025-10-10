# Transcript

A type that holds the transcript of a session.
The entries in the transcript are of type `TranscriptEntry`.

There is a system object for the current session.

```
>>> system.transcript.isTranscript
true
```

Entries are added using the methods:

- `addError`
- `addNotification`
- `addWarning`

```
>>> system.transcript
>>> .addNotification('Notify')
nil
```

The number of entries can be counted:

```
>>> system.transcript.size > 0
true
```

Entries can be retrieved using the methods:

- `messages`
- `errorMessages`
- `notificationMessages`
- `warningMessages`

```
>>> system.transcript
>>> .notificationMessages
>>> .last
'Notify'
```

The transcript can be cleared using `removeAll`:

```
>>> system.transcript.removeAll;
>>> system.transcript.size
0
```

* * *

See also: TranscriptEntry, TranscriptViewer

Guides: Printing Functions, System Functions
