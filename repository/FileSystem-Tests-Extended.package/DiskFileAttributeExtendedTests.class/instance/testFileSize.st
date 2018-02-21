tests - single attribute
testFileSize

	self assert: self fileAttributes size equals: 84.
	self assert: self targetFileAttributes size equals: 84.
	self assert: self symlinkAttributes size equals: 84.
	self assert: self symlinkLinkAttributes size equals: 65.
