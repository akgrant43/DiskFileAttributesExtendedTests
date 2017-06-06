tests - single attribute
testIsRegular

	self assert: self fileAttributes isRegular equals: true.
	self assert: self targetFileAttributes isRegular equals: true.
	self assert: self symlinkAttributes isRegular equals: true.
	self assert: self symlinkLinkAttributes isRegular equals: false.
