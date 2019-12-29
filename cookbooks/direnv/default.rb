package 'direnv'

file node[:shell_rc_file] do
    action :edit
    block do |content|
        cmd = 'eval "$(direnv hook zsh)"'
        content << "\n" + cmd unless content.include?(cmd)
    end
end