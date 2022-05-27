# dotfiles

## Before git clone

You must need to install git

```
echo "${your_user} ALL=NOPASSWD: ALL" >> /etc/sudoers.d/${your_user}

sed -e 's;http://archive;http://jp.archive;' -e  's;http://us\.archive;http://jp.archive;' -i /etc/apt/sources.list
apt update && apt upgrade -y
apt install -y git vim net-tools
```

# TODO
## VS code setteing

Insert param to settings.json

```whichwrap.jsona
{
    "vim.whichwrap": "b,s,h,l,<,>,[,],~",
}
```

```json
$FILE = $VSCODE_CONFIG_DIR/User/settings.json
```

```
mv $FILE $FILE.bak
jq -s '.[0] * .[1]' $FILE.bak wthichwrap.json > $FILE

```


