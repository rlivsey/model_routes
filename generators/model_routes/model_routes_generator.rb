class ModelRoutesGenerator < Rails::Generator::NamedBase

  def initialize(runtime_args, runtime_options = {})
    super
  end

  def manifest
    recorded_session = record do |m|
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_model_routes"
      m.template 'model.rb', 'app/models/model_route.rb'
    end

    action = nil
    action = $0.split("/")[1]
    case action
      when "generate" 
        puts
        puts ("-" * 70)
        puts "generated model and migration"
        puts ("-" * 70)
        puts
      when "destroy" 
        puts
        puts ("-" * 70)
        puts "Thanks for using model routes"
        puts ("-" * 70)
        puts
      else
        puts
      end
    recorded_session
  end

  protected

    def banner
      "Usage: #{$0} model_routes generate"
    end
    
end
