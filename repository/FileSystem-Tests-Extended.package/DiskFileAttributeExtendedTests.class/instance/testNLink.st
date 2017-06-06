tests - single attribute
testNLink
	"Assume that there is only one hard link to the just created temporary file"

	self assert: self fileAttributes numberOfHardLinks equals: 1.
	self assert: self targetFileAttributes numberOfHardLinks equals: 1.
	self assert: self symlinkAttributes numberOfHardLinks equals: 1.
	self assert: self symlinkLinkAttributes numberOfHardLinks equals: 1.
