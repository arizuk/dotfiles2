if darwin?
  package 'direnv'
else
  execute 'Install direnv' do
    command "curl -sfL https://direnv.net/install.sh |bin_path=#{node[:bin_dir]} bash"
    not_if "test -f #{node[:bin_dir]}/direnv"
    user node[:user]
  end
end

shell_rc_block 'eval "$(direnv hook zsh)"'
