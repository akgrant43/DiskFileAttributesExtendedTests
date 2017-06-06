tests
testFileSize

	self assert: self fileAttributes fileSize equals: 84.
	self assert: self targetFileAttributes fileSize equals: 84.
	self assert: self symlinkAttributes fileSize equals: 84.
	self assert: self symlinkLinkAttributes fileSize equals: 65.
