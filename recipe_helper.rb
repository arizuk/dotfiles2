MItamae::RecipeContext.class_eval do
    def include_cookbook(name)
      root_dir = File.dirname(__FILE__)
      p root_dir
    #   include_recipe File.join(root_dir, 'cookbooks', name, 'default')
    end
  end