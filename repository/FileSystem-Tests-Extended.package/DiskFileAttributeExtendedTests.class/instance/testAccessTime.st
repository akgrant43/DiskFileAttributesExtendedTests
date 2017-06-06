tests - single attribute
testAccessTime
	| resource accessTime |

	"Access Times may not be recorded, just check it is within the overall file set up times"
	resource := self tempFileResource.
	accessTime := self fileAttributes accessTime.
	self assert: resource timestamps first <= accessTime.
	self assert: resource timestamps last >= accessTime.

	accessTime := self targetFileAttributes accessTime.
	self assert: resource timestamps first <= accessTime.
	self assert: resource timestamps last >= accessTime.

	accessTime := self targetFileLinkAttributes accessTime.
	self assert: resource timestamps first <= accessTime.
	self assert: resource timestamps last >= accessTime.

	accessTime := self symlinkAttributes accessTime.
	self assert: resource timestamps first <= accessTime.
	self assert: resource timestamps last >= accessTime.

	accessTime := self symlinkLinkAttributes accessTime.
	self assert: resource timestamps first <= accessTime.
	self assert: resource timestamps last >= accessTime.

	"Requesting the access time from the symbolic link attributes should be the same as the access time of the target file"
	self assert: self symlinkAttributes accessTime
			equals: self targetFileAttributes accessTime.