{View} = require 'atom'

module.exports =
class GoImportsStatusView extends View
  @content: ->
    @div class: 'go-imports-status inline-block'

  destroy: ->
    @detach()

  initialize: ->
    setTimeout((=> @attach()), 0)

  attach: ->
    statusbar = atom.workspaceView.statusBar
    statusbar.appendRight this
