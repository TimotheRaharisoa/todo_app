Rails.application.config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"
Rails.application.config.view_component.preview_route = "/previews"
Rails.application.config.view_component.preview_controller = "PreviewController"

# Set the default view component path
Rails.application.config.view_component.view_component_path = "app/components" 