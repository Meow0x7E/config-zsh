# Z Shell Meow0x7E Config (ZMC)

## 使用

### 所需依赖

- `eza` (**Optional**)
- `zoxide` (**Optional**)
- `thefuck` (**Optional**)
- `yazi` (**Optional**)
- `bat` (**Optional**)

### 安装步骤

1. 克隆该仓库到 `~/.config/zsh`
   - `git clone https://github.com/Meow0x7E/config-zsh.git ~/.config/zsh`
2. 创建软连接
   - `ln -s ~/.config/zsh/zshrc.sh ~/.zshrc`

## 环境变量

- `ZSH_CONFIG_HOME` Config Home

## 结构

```json
{
  "name": "$ZSH_CONFIG_HOME",
  "files": [
    {
      "name": "init.sh",
      "type": "file",
      "description": "初始化时执行的脚本"
    },
    {
      "name": "zshrc.sh",
      "type": "file",
      "description": "有的插件会尝试修改该文件，所以单独放置，使用时应软链接到 `${HOME}/.zshrc`"
    },
    {
      "name": "before-source",
      "type": "directory",
      "description": "初始化时会顺序执行的内容",
      "files": [
        {
          "name": "00",
          "type": "prefix",
          "description": "Shell 环境初始化"
        },
        {
          "name": "10",
          "type": "prefix",
          "description": "别名绑定"
        },
        {
          "name": "20",
          "type": "prefix",
          "description": "方法声明"
        },
        {
          "name": "30",
          "type": "prefix",
          "description": "初始化额外命令行工具（可以覆盖 `别名绑定` 和 `方法声明` 已定义的部分）"
        }
      ]
    },
    {
      "name": "after-source",
      "type": "directory",
      "description": "初始化结束后会顺序执行的内容"
    }
  ]
}
```
