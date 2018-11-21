# Session

Vim으로 session 관리를 할 수 있다.

Session이 저장될 때, 기본적으로 buffer list가 저장된다. Buffer 이름은 보존되지만 buffer number는 아니다. Windows는 재생성되고, layout과 크기는 보존된다. Tab page는 같은 순서로 저장된다. Active window와 cursor position도 저장된다.

Vim8은 viminfo file의 상태를 저장하고, NeoVim은 shada (shared-data) file을 저장한다. 이것은 command-line history, search history, register 내용, mark의 위치 등을 저장하고 있다.

vim을 재시작하면 undo history는 잃어버린다. 이것은 session과 viminfo 모두 보존하지 못한다. 하지만, vim의 undofile option을 enable하면 hidden file에 해당 내용을 저장한다.

## Make Session

* `:mksession!` : 현재 작업중인 directory에 `Session.vim` file을 만들어 현재 session을 저장한다.
* `:mksession! {session_name.vim}` : 지정된 file로 session을 저장한다.

## Load Session

* `$ vim -S` : session을 load하여 vim을 실행한다.
* `$ vim -S {session_name.vim}` : 지정된 file로 session을 load하여 vim을 실행한다.
* `:source {session_name.vim}` : 해당 session을 load한다.

## Undofile

Vim 설정 file에 다음을 추가하면 undofile option을 enable 한다.

```vim
set undofile
```

기본적으로 undifile은 `filename.un~`와 같은 형태로 작업 중인 file과 같은 위치에 저장이 된다. 다음을 추가하면 특정 directory에 저장할 수 있다. NeoVim의 경우 `undodir` 값이 `$XDG_DATA_HOME/nvim/undo`로 기본 설정 되어있다.

```vim
set undodir=$VIMDATA/undo
```

Password같은 민감한 정보가 있는 특정 file혹은 directory에서 작업할 때만 보안상 혹은 그 외의 목적으로 undofile을 disable하고 싶으면 다음과 같이 설정한다.

```vim
augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
```

## NeoVim Session

NeoVim에서 `:terminal {cmd}` 명령으로 실행시킨 {cmd}는 session이 복구될 때 재시작된다. 반면에, `:terminal` 명령으로 실행시킨 terminal에서 실행시킨 명령은 재시작되지 않고, terminal만 복구된다. 이를 응용하여 `:file {name}` 명령으로 terminal의 이름을 변경하면, 재시작 시킬 수 있다.

> Ex) :file term://PORT=3001 npm run server

## Reference

* :h `:mksession`
* :h `'sessionoptions'`
* :h `viminfo-file`
* :h `shada-file`
* :h `persistent-undo`
* :h `file_f`
