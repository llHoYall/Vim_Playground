# projectionist

projectionist는 원하는 file을 편하게 찾아 open할 수 있게 도와주는 plugin이다.

## Installation

> $ cd {VIMCONFIG}/pack/bundle/start
>
> $ git clone https://github.com/tpope/vim-projectionist.git

## Usage

Projectionist는 `.projections.json` file을 사용하여 설정한다. Project의 root directory에 이 파일을 생성한다.

예를 들면, 다음과 같다.

```json
{
	"src/models/*.js":
	{
		"type": "model",
		"alternate": "tests/models/{}.text.js"
	},
	"tests/models/*.test.js":
	{
		"type": "modelTest",
		"alternate": "src/models/{}.js"
	}
}
```

이제, vim에서 다음과 같이 명령을 실행한다.

`:Emodel comment`

Projectionist가 설정 file에서 model에 해당하는 정의를 찾아 `*`을 comment로 치환한다. 즉, `src/models/comment.js` file을 찾아서 연다.

다음 명령을 실행하면 현재 열려있는 file의 alternate file을 연다.

`:A`

## Navigation

* `:E{type}` - Opens the specified type in the current window.
* `:S{type}` - Opens the specified type in a horiznotal split.
* `:V{type}` - Opens the specified type in a vertical split.
* `:T{type}` - Opens the specified type in a new tabpage.

## Alternation

* `:A {filename}` - Jump to an alternate file in the current window.
* `:AS {filename}` - Jump to an alternate file in a horizontal split.
* `:AV {filename}` - Jump to an alternate file in a vertical split.
* `:AT {filename}` - Jump to an alternate file in a new tabpage.
