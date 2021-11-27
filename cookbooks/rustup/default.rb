execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if "test -f #{ENV['HOME']}/.cargo/bin/rustup"
  user node[:user]
end