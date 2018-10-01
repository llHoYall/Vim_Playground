# Vim8

## Installation

### on MAC

> $ brew install vim

이미 vim이 설치되어 있고, 버전이 낮다면 다음의 방법을 사용한다.

> $ brew upgrade vim

### on Linux (Debian)

> $ sudo apt install -y vim

Vim8이 설치되지 않는다면 다음의 방법을 사용한다.

> $ sudo add-apt-repository ppa:jonathonf/vim
>
> $ sudo apt update
>
> $ sudo apt install -y vim

### on Windows

> $ choco install -y vim

## Configuration

Vim8은 `~/.vim` directory에 설정을 저장한다. 또한, 기본 설정 파일은 `vimrc`이다.

## Running

* $ vim -u NONE -N
	+ vim을 기본 설정으로 실행한다.
* $ vim -u \<xxx\>.vim
	+ vim을 명시한 파일의 설정으로 실행한다.
