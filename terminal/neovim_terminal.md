# Terminal on NeoVim

NeoVim에는 추가로 `terminal mode`가 있다. 이 mode에서는 내장 terminal emulator를 사용할 수 있다.

Terminal cursor는 동작 중인 program에서 관리하고, normal cursor는 NeoVim에서 관리한다.

## Commands

### Run Terminal

* `:terminal` - terminal emulator가 실행된다.
* `:terminal [cmd]` - cmd와 함께 terminal emulator를 실행한다.
  > :terminal yarn start

### Terminal mode

`i`, `A` 등의 `insert mode`로 전환되는 키 혹은 명령어를 terminal emulator에서 사용하면 `terminal mode`로 전환한다.

* `<C-\><C-n>` - `terminal mode`에서 `normal mode`로 전환한다.
* `<C-a>`, `<M-b>` - `terminal mode`의 bash shell에서 cursor를 맨 앞으로 이동한다.
* `<C-e>`, `<M-f>` - `terminal mode`의 bash shell에서 cursor를 맨 뒤로 이동한다.

## Configuration

```vim
if has('nvum')
  tnoremap  <ESC>       <C-\><C-n>
  tnoremap  <C-v><ESC>  <ESC>
endif
```

## Reference

* :h `:terminal`
