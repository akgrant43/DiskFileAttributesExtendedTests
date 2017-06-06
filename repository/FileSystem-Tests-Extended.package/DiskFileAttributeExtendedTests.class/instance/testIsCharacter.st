tests
testIsCharacter

	self assert: self fileAttributes isCharacter equals: false.
	self assert: self targetFileAttributes isCharacter equals: false.
	self assert: self symlinkAttributes isCharacter equals: false.
	self assert: self symlinkLinkAttributes isCharacter equals: false.
