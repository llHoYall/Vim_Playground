# fzf

Fuzzy finder.

## Usage

* `:FZF` - Open fuzzy finder
* `<C-j>`, `<C-k>` - Select previous/next item from matchlist
* `<CR>` - Open the selected file in the current window
* `<C-x>` - Open the selected file in a horizontal split
* `<C-v>` - Open the selected file in a vertical split
* `<C-t>` - Open the selected file in a new tab page
* `<C-c>` - Dismiss the fzf picker

## Configuration

* export FZF_DEFAULT_COMMAND='rg --files'
	+ Vim에서 FZF를 실행시킬 때, 자동으로 설정된 명령을 실행한다.
	+ RipGrep을 사용하여 file을 나열하며, `--file` 옵션은 Git, Mercurial, Subversion 등의 저장소에서 ignore된 file들은 무시한다.

## Reference

* [fzf](https://github.com/junegunn/fzf)
