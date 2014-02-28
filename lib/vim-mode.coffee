VimState = require './vim-state'

module.exports =

  activate: (state) ->
    atom.workspaceView.eachEditorView (editorView) =>
      return unless editorView.attached

      editorView.addClass('vim-mode')
      editorView.vimState = new VimState(editorView)

  deactivate: ->
    # Put the user back in insert mode before ending
    @vimState.activateInsertMode()
