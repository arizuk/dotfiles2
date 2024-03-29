include_cookbook 'base'
include_cookbook 'homebrew'

include_cookbook 'z'
include_cookbook 'zsh'

include_cookbook 'anyenv'
include_cookbook 'direnv'
include_cookbook 'ghq'
include_cookbook 'git'
include_cookbook 'poetry'
include_cookbook 'tmux'
include_cookbook 'vim'
include_cookbook 'rustup'

package 'bat'
package 'coreutils'
package 'gnu-sed'
package 'htop-osx'
package 'httpie'
package 'jq'
package 'nkf'
package 'the_silver_searcher'
package 'tig'
package 'tree'
package 'watch'
package 'wget'

include_cookbook 'mas'

homebrew_cask 'notion'
homebrew_cask 'slack'
homebrew_cask 'iterm2'

include_cookbook 'macos'
include_cookbook 'karabiner'
include_cookbook 'vscode'