MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root_dir = File.dirname(__FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name)
  end

  def include_role(name)
    root_dir = File.dirname(__FILE__)
    include_recipe File.join(root_dir, 'roles', name)
  end  
end