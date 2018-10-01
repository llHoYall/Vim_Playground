# Neovim

## Installation

### on MAC

> $ brew install neovim

### on Linux (Debian)

> $ sudo apt install -y neovim

Neovim이 설치되지 않는다면 다음의 방법을 사용한다.

> $ sudo add-apt-repository ppa:neovim-ppa/stable
>
> $ sudo apt install -y neovim

### on Windows

> $ choco install -y neovim

## Configuration

Neovim은 `~/.config/nvim` directory에 설정을 저장한다. 또한, 기본 설정 파일은 `init.vim`이다.

Data는 `~/.local/share/nvim` directory에 저장한다.

## Running

* $ nvim
	+ Neovim을 실행한다.

## Enable Python Support

> $ pip3 install --user --upgrade neovim

## neovim-remote

neovim을 사용하여 원격 개발을 할 수 있도록 도와주는 plugin이다. python3 neovim client가 필요하다.

> $ pip3 install --user --upgrade neovim-remote

`~/.local/bin/nvr`에 설치가 되고 PATH에 등록을 하면 된다.

> $ nvr -h
