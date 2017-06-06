tests
testCreationTime

	| resource hasCreationTime creationTime laterTime |

	resource := self tempFileResource.
	"The later bounds for the creation time depends on whether the test file system records creation time"
	hasCreationTime := self fileAttributes hasCreationTime.
	laterTime := hasCreationTime ifTrue: 
		[ resource timestamps at: 2 ]
	ifFalse:
		[ resource timestamps last ].

	creationTime := self fileAttributes creationTime.
	self assert: resource timestamps first <= creationTime.
	self assert: laterTime >= creationTime.

	creationTime := self targetFileAttributes creationTime.
	self assert: resource timestamps first <= creationTime.
	self assert: laterTime >= creationTime.

	creationTime := self targetFileLinkAttributes creationTime.
	self assert: resource timestamps first <= creationTime.
	self assert: laterTime >= creationTime.

	creationTime := self symlinkAttributes creationTime.
	self assert: resource timestamps first <= creationTime.
	self assert: laterTime >= creationTime.

	creationTime := self symlinkLinkAttributes creationTime.
	self assert: resource timestamps first <= creationTime.
	self assert: laterTime >= creationTime.

	"Requesting the access time from the symbolic link attributes should be the same as the access time of the target file"
	self assert: self symlinkAttributes creationTime
			equals: self targetFileAttributes creationTime.