node.reverse_merge!(
    user: ENV['SUDO_USER'] || ENV['USER'],
  )

include_recipe 'recipe_helper'
include_recipe "roles/#{node[:platform]}"