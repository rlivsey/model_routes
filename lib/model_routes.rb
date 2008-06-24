module Livsey
  module Plugins
    module ModelRoutes
   
      module ActiveRecord
        def self.included(base)
          
        end
      end
    
      module RouteSet
        def self.included(base)
          base.alias_method_chain :recognize_path, :filter
        end
        
        # rewrite incoming request if we have an alias for them
        def recognize_path_with_filter(path, environment={})
          if route = ModelRoute.find_by_external_path(path)            
            path = route.internal_path
          end
          recognize_path_without_filter(path, environment)
        end
        
      end
    
    end
  end
end

ActionController::Routing::RouteSet.send :include, Livsey::Plugins::ModelRoutes::RouteSet