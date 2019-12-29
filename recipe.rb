include_recipe 'recipe_helper'
include_recipe "roles/#{node[:platform]}"
include_cookbook "hoge"