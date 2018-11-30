# Autocommand

## Syntax

### Defining autocommands

> au[tocmd] [group] {event} {pattern} [nested] {cmd}

### Removing autocommands

> au[tocmd]! [group] {event} {pattern} [nested] {cmd}

autocommand를 group으로 정의할 때, 동일한 것을 정의하더라도 삭제되지 않고 매번 중복되므로 반드시 먼저 삭제를 하고 정의를 해야한다.

```vim
" Ex)
augroup group_name
  au!
  au BufReadPost * echo 'Reading: ' . expand('<afile>')
  au BufWritePost * echo 'Writing: ' . expand('<afile>')
augroup END
```

### cmd

\<afile>은 현재 file의 이름을 나타내며 autocommand 실행 중에만 정의된다.

## Reference

* :h `:autocmd`
* :h `autocommand-remove`
* :h `FileType`
* :h `BufNewFile`
* :h `BufReadPost`
* :h `<afile>`
