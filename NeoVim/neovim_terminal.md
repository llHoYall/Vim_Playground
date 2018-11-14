# Terminal on NeoVim

NeoVim에는 추가로 `terminal mode`가 있다. 이 mode에서는 내장 terminal emulator를 사용할 수 있다.

Terminal cursor는 동작 중인 program에서 관리하고, normal cursor는 NeoVim에서 관리한다.

Terminal buffer의 내용을 vim의 register에 yank하거나 paste할 수 있다. normal cursor의 위치에서 yank를 하고, terminal cursor의 위치에 paste를 한다.

## Run Terminal

* `:te[rminal]` - terminal emulator가 실행된다.

## Terminal Mode

`i`, `A` 등의 `insert mode`로 전환되는 키 혹은 명령어를 terminal emulator에서 사용하면 `terminal mode`로 전환한다.

### Change Mode

* `<C-\><C-n>` - `terminal mode`에서 `normal mode`로 전환한다.

### Move Cursor

* `<C-a>`, `<M-b>` - `terminal mode`의 bash shell에서 cursor를 맨 앞으로 이동한다.
* `<C-e>`, `<M-f>` - `terminal mode`의 bash shell에서 cursor를 맨 뒤로 이동한다.

### Scroll Screen

* `gg` - Buffer의 최상단으로 scroll한다.
* `G` - Buffer의 최하단으로 scroll한다.
* `<C-y>` - 1 line 위로 scroll 한다.
* `<C-e>` - 1 line 아래로 scroll 한다.
* `<C-u>` - 화면의 반만큼 위로 scroll 한다.
* `<C-d>` - 화면의 반만큼 아래로 scroll 한다.
* `<C-b>` - 화면만큼 위로 scroll 한다.
* `<C-f>` - 화면만큼 아래로 scroll 한다.

Terminal buffer에 filepath가 있을 경우, normal mode로 전환하여, `gf`, `<C-^>` 명령을 사용할 수 있다. build나 test suite 실패 시 유용하게 사용할 수 있다.

## Terminal Buffer

NeoVim은 terminal buffer라는 feature를 제공한다.

* `:terminal {cmd}` - cmd의 결과로 terminal buffer를 생성한다.
  > :terminal yarn start
* `:split | terminal {cmd}` - 수평 분할로 terminal buffer를 생성한다.
* `:vsplit | terminal {cmd}` - 수직 분할로 terminal buffer를 생성한다.
* `tabedit | terminal {cmd}` - 새 tab page로 terminal buffer를 생성한다.

`jobsend()` 함수를 사용하여 동작중인 terminal buffer의 stdin에 data를 쓸 수 있다.

> jobsend({job ID}, {data})

위와 같은 형식으로 사용을 할 수 있다.

> :echo b:terminal_job_id

위와 같은 명령을 수행하여 현재 동작중인 terminal의 job id를 얻을 수 있고, 이를 사용하여 다음의 예처럼 사용할 수 있다.

> Ex) :call jobsend(1, "\<C-c>yarn server\<CR>")

두 번째 argument는 double quote이어야 하며, single quote는 안 된다.

## Configuration

다음은 `terminal mode`에서 `insert mode`로 전환을 쉽게 해주는 설정이다.

```vim
if has('nvim')
  tnoremap  <ESC>       <C-\><C-n>
  tnoremap  <C-v><ESC>  <ESC>
endif
```

다음은 `terminal mode`에서 분할창 간의 이동을 쉽게 해주는 설정이다.

```vim
nnoremap  <M-h>   <C-w>h
nnoremap  <M-j>   <C-w>j
nnoremap  <M-k>   <C-w>k
nnoremap  <M-l>   <C-w>l
if has('nvim')
  tnoremap  <M-h>   <C-\><C-n><C-w>h
  tnoremap  <M-j>   <C-\><C-n><C-w>j
  tnoremap  <M-k>   <C-\><C-n><C-w>k
  tnoremap  <M-l>   <C-\><C-n><C-w>l
endif
```

다음은 `jobsend()`를 사용하여 custom 명령을 만드는 설정 예이다.

```vim
:command! restart call jobsend(1, "\<C-c>yarn server\<CR>")
```

보통 job id는 바뀔 가능성이 높으며 custom command는 재사용 성이 높지 않으므로, vim 설정 파일에는 넣지 않는다.

다음은 terminal buffer의 shell을 customization하는 방법이다. NeoVim이 시작되면 `$NVIM_LISTEN_ADDRESS`라는 환경 변수가 설정된다. 이를 사용하면, NeoVim의 terminal에서 shell을 실행한 것인지 일반 terminal에서 shell을 실행한 것인지 구별을 해줄 수 있다.

다음은 nvr을 사용하여 NeoVim 안에서 NeoVim을 중첩해서 실행하는 것을 막는 설정이다.

아래의 내용을 shell 설정 파일에 넣는다.

```sh
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "Nonesting!"'
  fi
fi
```

다음은 zsh을 사용할 때, `<C-x><C-e>` 키를 `edit-command-line` 함수에 mapping 시키는 설정이다. `.zshrc` file에 다음의 내용을 넣는다.

```sh
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
```

다음은 git 등의 program과 연동 시의 설정이다.

git은 commit 시 `$VISUAL`에 설정된 editor를 실행하므로, NeoVim이 중첩 실행될 수 있다. (git의 core.editor 설정은 default)

```vim
if has('nvim) && executable('nvr)
  let $VISUAL="nvr -cc split --remote-wait | 'set bufhidden=wiwpe'"
endif
```

## Reference

* :h `:terminal`
* :h `jobsend()`
