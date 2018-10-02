# Package

Package는 Vim8에서 추가된 feature로 별도의 plugin manager의 도움없이 plugin을 관리할 수 있다. Package는 하나 이상의 plugin을 포함한다.

관습적으로 `{VIMCONFIG}/pack` directory로 package를 관리한다.

Package directory는 `start` subdirectory를 가질 수 있으며, vim의 시작 시 자동으로 load할 plugin들을 여기에 설치한다.

Package directory는 `opt` subdirectory를 가질 수 있으며, optional plugin들을 여기에 설치한다. 자동으로 load되지 않으므로 사용이 필요한 시점에 `:packadd {plugin_name}` 명령을 실행하여 load한다.

