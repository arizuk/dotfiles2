cpu_arch = run_command('uname -m').stdout.strip
if cpu_arch == 'x86_64'
  github_binary 'ghq' do
    repository 'motemen/ghq'
    version 'v1.2.1'
    archive "ghq_#{node[:os]}_amd64.zip"
    binary_path "ghq_#{node[:os]}_amd64/ghq"
  end
else
  package 'ghq'
end