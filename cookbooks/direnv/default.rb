if darwin?
  package 'direnv'
else
  execute "curl -sfL https://direnv.net/install.sh |bin_path=#{ENV['HOME']}/bin bash" do
    not_if "test -f #{ENV['HOME']}/bin/direnv"
    user node[:user]
  end
end

shell_rc_block 'eval "$(direnv hook zsh)"'
