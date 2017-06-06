tests
testModificationTime

	| resource modificationTime |

	resource := self tempFileResource.
	modificationTime := self fileAttributes modificationTime.
	self assert: (resource timestamps at: 2) <= modificationTime.
	self assert: (resource timestamps at: 3) >= modificationTime.

	modificationTime := self targetFileAttributes modificationTime.
	self assert: resource timestamps first <= modificationTime.
	self assert: (resource timestamps at: 2) >= modificationTime.

	modificationTime := self targetFileLinkAttributes modificationTime.
	self assert: resource timestamps first <= modificationTime.
	self assert: (resource timestamps at: 2) >= modificationTime.

	modificationTime := self symlinkAttributes modificationTime.
	self assert: resource timestamps first <= modificationTime.
	self assert: (resource timestamps at: 2) >= modificationTime.

	modificationTime := self symlinkLinkAttributes modificationTime.
	self assert: resource timestamps first <= modificationTime.
	self assert: (resource timestamps at: 2) >= modificationTime.

	"Requesting the access time from the symbolic link attributes should be the same as the access time of the target file"
	self assert: self symlinkAttributes modificationTime
			equals: self targetFileAttributes modificationTime.