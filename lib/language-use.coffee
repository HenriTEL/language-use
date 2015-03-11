LanguageUseView = require './language-use-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageUse =
  subscriptions: null

  activate: (state) ->
    @languageUseView = new LanguageUseView(state.languageUseViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageUseView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-use:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageUseView.destroy()

  serialize: ->
    languageUseViewState: @languageUseView.serialize()

  toggle: ->
    console.log 'LanguageUse was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
