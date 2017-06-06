running
setUp

	| ws ts proc |

	timestamps := OrderedCollection new.
	file := FileLocator temp / ('FileAttributesTests-', UUIDGenerator next asString, '.txt').
	targetFile := FileLocator temp / ('FileAttributesTests-', UUIDGenerator next asString, '.txt').
	symboliclink := FileLocator temp / ('FileAttributesTests-', UUIDGenerator next asString, '.txt').
	ts := DateAndTime now.
	"Remove the nanoseconds"
	ts := DateAndTime
		date: ts asDate
		time: (Time seconds: ts secondsSinceMidnightLocalTime nanoSeconds: 0).
	timestamps add: ts. "1"

	"Create the file"
	ws := file writeStream.
	[
		ws nextPutAll: 'Created by DiskFileAttributesExtendedTestsResources>>setUp '.
		ts printOn: ws.
	] ensure: [ ws close ].

	"Create the target file"
	ws := targetFile writeStream.
	[
		ws nextPutAll: 'Created by DiskFileAttributesExtendedTestsResources>>setUp '.
		ts printOn: ws.
	] ensure: [ ws close ].
	"Create a symbolic link to the file"
	proc := OSProcess command: (String streamContents: [ :stream |
			stream
				<< 'ln -s ';
				<< targetFile fullName;
				<< ' ';
				<< symboliclink fullName ]).
	[ proc isComplete ] whileFalse:
		[ (Delay forMilliseconds: 500) wait ].
	self assert: proc exitStatus equals: 0.
	ts := DateAndTime now rounded.
	"Round up to the next second"
	ts := DateAndTime
		date: ts asDate
		time: (Time seconds: ts secondsSinceMidnightLocalTime + 1 nanoSeconds: 0).
	timestamps add: ts. "2"

	"File timestamps are only to the second, wait a couple of seconds to ensure timestamp increases.
	Waiting 1 second doesn't appear to be enough - TODO figure out why"
	(Delay forSeconds: 2) wait.

	"Modify the file"
	ws := file writeStream.
	[
		ws nextPutAll: 'Updated by DiskFileAttributesExtendedTestsResources>>setUp '.
		ts printOn: ws.
	] ensure: [ ws close ].

	ts := DateAndTime now rounded.
	"Round up to the next second"
	ts := DateAndTime
		date: ts asDate
		time: (Time seconds: ts secondsSinceMidnightLocalTime + 1 nanoSeconds: 0).
	timestamps add: ts. "3"

	(Delay forSeconds: 2) wait.

	"Change the files"
	file renameTo: (file basename, '.new').
	symboliclink renameTo: (symboliclink basename, '.symlink').

	ts := DateAndTime now rounded.
	"Round up to the next second"
	ts := DateAndTime
		date: ts asDate
		time: (Time seconds: ts secondsSinceMidnightLocalTime + 1 nanoSeconds: 0).
	timestamps add: ts. "4"
