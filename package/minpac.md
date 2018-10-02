# minpac

minpac은 vim8의 package feature로 만든 minimal plugin manager이다.

## Installation

minpac은 optional plugin으로 설치해야한다.

1. minpac으로 관리할 새로운 package를 생성한다.
	> $ mkdir -p {VIMCONFIG}/pack/minpac/opt
2. 위의 경로에 minpac을 설치한다.
	> $ git clone https://github.com/k-takata/minpac.git
3. vim 설정 file에 minpac 설정을 추가한다.
	```vim
	packadd minpac
	call minpac#init()
	```

## Add Plugin

vim 설정 file에 다음과 같은 형식으로 추가할 plugin을 명시한다.

> call minpac#add('{github_username/github_repo}', [option])

사용 예는 다음과 같다.

```vim
call minpac#add('llHoYall/vim-plugin')
call minpac#add('k-takata/minpac', {'type': 'opt'})
```

## Update Plugin

다음 명령을 실행하면 자동으로 모든 plugin을 update 한다.

> :call minpac#update()

## Remove Plugin

설정 file에서 삭제할 plugin의 `call minpac#add()` 명령을 지우고 다음 명령을 실행한다.

> :call minpac#clean()

## Configuration

설정 file에 다음과 같이 명령어를 만들어두면 불필요한 typing을 줄일 수 있다.

```vim
command! packu call minpac#update()
command! packc call minpac#clean()
```

## Reference

### Vim8

* :h `channel`

### Neovim

* :h `job-control`
