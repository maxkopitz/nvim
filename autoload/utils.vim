" Check if we are inside a Git repo.
function! utils#Inside_git_repo() abort
  let res = system('git rev-parse --is-inside-work-tree')
  if match(res, 'true') == -1
    return v:false
  else
    " Manually trigger a special user autocmd InGitRepo (to use it for
    " lazyloading of fugitive by packer.nvim).
    " See also https://github.com/wbthomason/packer.nvim/discussions/534.
    doautocmd User InGitRepo
    return v:true
  endif
endfunction

function! utils#GetGitBranch()
  let l:res = systemlist('git rev-parse --abbrev-ref HEAD')[0]
  if match(l:res, 'fatal') != -1
    return ''
  else
    return l:res
  endif
endfunction

