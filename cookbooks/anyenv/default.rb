git "#{ENV['HOME']}/.anyenv" do
    repository "https://github.com/anyenv/anyenv"
end

file node[:shell_rc_file] do
    action :edit
    block do |content|
        cmd = 'export PATH="$HOME/.anyenv/bin:$PATH"'
        content << "\n" + cmd unless content.include?(cmd)

        cmd = 'eval "$(anyenv init -)"'
        content << "\n" + cmd unless content.include?(cmd)
    end
end