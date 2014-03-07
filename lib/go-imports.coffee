exec = require('child_process').exec

GoImportsStatusView = require './go-imports-view'

module.exports =
  view: null

  configDefaults:
    executable: 'goimports'
    formatOnSave: true

  activate: (state) ->
    @view = new GoImportsStatusView(state.goImportsViewState)
    atom.project.eachEditor (editor) =>
      @attachEditor editor
    atom.subscribe atom.project, 'editor-created', (editor) =>
      @attachEditor editor

    atom.workspaceView.command 'go-imports:fix-imports', =>
      editor = atom.workspace.getActiveEditor()
      if editor
        @fixImports editor

  deactivate: ->
    @view.destroy()
    atom.unsubscribe atom.project

  serialize: ->
    viewState: @view.serialize()

  attachEditor: (editor) ->
    atom.subscribe editor.getBuffer(), 'reloaded saved', =>
      if atom.config.get('go-imports.formatOnSave')
        @fixImports(editor)
    atom.subscribe editor.getBuffer(), 'destroyed', ->
      atom.unsubscribe(editor.getBuffer())

  fixImports: (editor) ->
    if editor and editor.getPath()

      scope = editor.getCursorScopes()[0]

      if scope is 'source.go'
        cmd = atom.config.get('go-imports.executable')

        exec cmd + ' -w ' + editor.getPath(), (err, stdout, stderr) =>
          if not err or err.code is 0
            @view.html('').hide()
          else
            message = 'Imports error.'
            if stderr.match(/command not found/)
              message = 'Cannot find goimports executable.'

            @view.html('<span class="error">' + message + '</span>').show()
