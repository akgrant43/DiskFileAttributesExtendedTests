tests - single attribute
testIsSocket

	self assert: self fileAttributes isSocket equals: false.
	self assert: self targetFileAttributes isSocket equals: false.
	self assert: self symlinkAttributes isSocket equals: false.
	self assert: self symlinkLinkAttributes isSocket equals: false.
