function sk-select-history()
{
    BUFFER=$(fc -l -n 1 | sk --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N sk-select-history

function sk-z-move()
{
  local res=$(z | sort -rn | cut -c 12- | sk)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N sk-z-move

function sk-git-select-modified-files()
{
    file=$(cat <(git diff --name-only) <(git diff --cached --name-only)|sort|uniq|sk -m --prompt "[select file]"|tr '\n' ' ')
    BUFFER="${BUFFER}${file}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N sk-git-select-modified-files

function sk-git-select-files()
{
    files=$(git ls-files $(git rev-parse --show-toplevel)|sk -m --prompt "[find file]" --preview "preview.sh {}"|tr '\n' ' ')
    BUFFER="${BUFFER}${files}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N sk-git-select-files

function sk-select-files()
{
    files=$(ag -g ".*"|sk -m --preview "preview.sh {}")
    BUFFER="${BUFFER}${files}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N sk-select-files

function sk-open-files()
{
    files=$(sk -m --ansi -i -c 'ag --color "{}"' --preview "preview.sh {}" |cut -d: -f1,2|tr '\n', ' ')
    if [ ! -z "${files}" ]; then
      BUFFER+="code -g ${files}"
      zle accept-line
    fi
    return 1
}
zle -N sk-open-files

function sk-git-cd()
{
    dir=$(git ls-files $(git rev-parse --show-toplevel)|sed -e '/^[^\/]*$/d' -e 's/\/[^\/]*$//g'|sort|uniq|sk)
    if [ ! -z "${dir}" ]; then
      BUFFER+="cd ${dir}"
      zle accept-line
    fi
    return 1
}
zle -N sk-git-cd

which sk > /dev/null
if [ $? -eq 0 ]; then
  bindkey '^R' sk-select-history
  bindkey '^z' sk-z-move
  bindkey '^g^f' sk-git-select-files
  bindkey '^g^m' sk-git-select-modified-files
  bindkey '^g^r' sk-select-files
  bindkey '^g^o' sk-open-files
  bindkey '^g^a' sk-git-cd
fi