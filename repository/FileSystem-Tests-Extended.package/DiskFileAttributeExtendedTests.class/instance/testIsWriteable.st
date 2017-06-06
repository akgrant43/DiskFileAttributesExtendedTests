tests
testIsWriteable

	self assert: self fileAttributes isWritable equals: true.
	self assert: self targetFileAttributes isWritable equals: true.
	self assert: self symlinkAttributes isWritable equals: true.
	self assert: self symlinkLinkAttributes isWritable equals: true.
