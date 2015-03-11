describe 'USE grammar', ->
	grammar = null
	beforeEach ->
		waitsForPromise ->
				atom.packages.activatePackage('language-use')

		runs ->
			grammar = atom.grammars.grammarForScopeName('source.use')

	it 'parses the grammar', ->
		expect(grammar).toBeTruthy()
		expect(grammar.scopeName).toBe 'source.use'
