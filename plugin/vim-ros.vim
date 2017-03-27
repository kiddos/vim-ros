if exists('g:loaded_vim_ros')
  finish
endif
let g:loaded_vim_ros = 1

let g:ros_catkin_workspace =
\   get(g:, 'ros_catkin_workspace', '~/catkin_ws')

function ROSGetSetupScript()
  let workspace_path = expand(g:ros_catkin_workspace)
  let devel_path = workspace_path.'/devel'
  let shell = $SHELL
  let script_path = ''
  if shell =~ 'zsh'
    let script_path = devel_path.'/setup.zsh'
  elseif shell =~ 'bash'
    let script_path = devel_path.'/setup.bash'
  else
    let script_path = devel_path.'/setup.sh'
  endif

  if !empty(glob(script_path))
    return script_path
  else
    return ''
  endif
endfunction

let g:ros_setup_script = ROSGetSetupScript()

let g:ros_is_setup = 0

function ROSSetup()
  if g:ros_is_setup == 1
    finish
  endif

  if g:ros_setup_script != ''
    execute '!source '.g:ros_setup_script
  else
    echo 'ERROR: Can not find setup script, please set your catkin workspace variable'
  endif
endfunction

function ROSMake()
  call ROSSetup()
  execute '!rosmake'
endfunction

function CatkinMake(...)
  call ROSSetup()
  silent execute 'lcd '.g:ros_catkin_workspace
  if exists('a:1')
    execute '!catkin_make '.a:1
  else
    execute '!catkin_make'
  endif
endfunction

command! ROSMake call ROSMake()
command! -nargs=* CatkinMake call CatkinMake(<f-args>)
