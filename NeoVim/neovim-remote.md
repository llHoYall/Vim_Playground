# NeoVim-Remote

NeoVim을 사용하여 원격 개발을 할 수 있도록 도와주는 plugin이다. python3 neovim client가 필요하다.

> $ pip3 install --user --upgrade neovim-remote

`~/.local/bin/nvr`에 설치가 되고 PATH에 등록을 하면 된다.

> $ nvr -h

nvr을 사용해서 file을 open하면 NeoVim을 중첩해서 실행하지 않고, 이미 실행중인 NeoVim에 open된다.

## Commands

* `nvr <file>` - 현재 창에 file을 연다.
* `nvr -l <file>` - 마지막으로 활성화된 창에 file을 연다.
* `nvr -o < files>` - 수평 분할 창에 file을 연다.
* `nvr -O < files>` - 수직 분할 창에 file을 연다.
* `nvr -p < files>` - Tab page에 file을 연다.
