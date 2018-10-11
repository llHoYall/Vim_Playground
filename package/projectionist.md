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
	"app/models/*.js":
	{
		"type": "model"
	}
}
```

이제, vim에서 다음과 같이 명령을 실행한다.

`:Emodel comment`

Projectionist가 설정 file에서 model에 해당하는 정의를 찾아 `*`을 comment로 치환한다. 즉, `app/models/comment.js` file을 찾아서 연다.

## Navigation

* `:E{type}` - Opens the specified type in the current window
* `:S{type}` - Opens the specified type in a horiznotal split
* `:V{type}` - Opens the specified type in a vertical split
* `:T{type}` - Opens the specified type in a new tabpage
