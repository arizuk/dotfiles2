package 'git'

dotfile 'gitconfig'

file "#{ENV['HOME']}/.gitignore_global" do
  owner node[:user]
end

if darwin?
  executable_link '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight'
else
  execute "Make diff-highlight" do
    command "make diff-highlight"
    cwd "/usr/share/doc/git/contrib/diff-highlight"
    not_if "test -f diff-highlight"
  end

  executable_link '/usr/share/doc/git/contrib/diff-highlight/diff-highlight'
end

# vimdiff dependency
include_cookbook 'vim'
