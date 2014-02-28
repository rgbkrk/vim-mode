VimState = require './vim-state'

console.log "Booting pseudo-vim"

module.exports =

  activate: (state) ->
    atom.workspaceView.eachEditorView (editorView) =>
      return unless editorView.attached

      editorView.addClass('vim-mode')
      editorView.vimState = new VimState(editorView)

  deactivate: ->
    # Put the user back in insert mode before ending
    atom.workspaceView.eachEditorView(editorView) ->
      editorView.vimState.activateInsertMode
