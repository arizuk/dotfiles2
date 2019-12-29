git "#{ENV['HOME']}/.anyenv" do
    repository "https://github.com/anyenv/anyenv"
end

file "#{ENV['HOME']}/.zshrc.local" do
    action :edit
    block do |content|
        code = 'export PATH="$HOME/.anyenv/bin:$PATH"'
        content << "\n" + code unless content.include?(code)

        code = 'eval "$(anyenv init -)"'
        content << "\n" + code unless content.include?(code)
    end
end