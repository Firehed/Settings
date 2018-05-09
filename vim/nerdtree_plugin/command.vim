call NERDTreeAddMenuItem({
    \ 'text': '(e)xecute OS command on a childnode',
    \ 'shortcut': 'e',
    \ 'callback': 'NERDTreeOSCommand',
    \ 'isActiveCallback': 'NERDTreeOSCommandIsActive' })

function! NERDTreeOSCommandIsActive()
    let node = g:NERDTreeFileNode.GetSelected()
    return node.path.isDirectory
endfunction

function! NERDTreeOSCommand()
    let cwd = getcwd()
    let node = g:NERDTreeFileNode.GetSelected()
    let command = input('Command: ')
    silent call node.path.changeToDir()
    echo "\n" . system(command)
    call node.refresh()
    call b:NERDTree.render()
    redraw
    execute "cd " . cwd
endfunction

