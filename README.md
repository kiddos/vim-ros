vim-ROS
=======

vim plugin for ROS development

Setup
=====

Install it using your favorite plugin manager. I use Neobunble

  ```vim
  NeoBundle 'kiddos/vim-ros'
  ```

  ```vim
  :source %
  :NeoBundleInstall
  ```

Catkin workspace location needs to be set in `vimrc`

  ```
  let g:ros_catkin_workspace = '~/catkin_ws'
  ```

### Optional

  You can setup your favorite shell

  ```vim
  set shell=zsh\ --login
  ```

Features
========

* Commands

  - `:CatkinMake` temporary change your directory to catkin workspace and run `catkin_make`

  - `:ROSMake` run rosmake in the current directory

* syntax highlighting
