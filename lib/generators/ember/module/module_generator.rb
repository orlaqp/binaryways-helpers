require 'rails'

module Ember
  module Generators

    class ModuleGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      argument :model_attributes, :type => :array, :required => true

      def generate_pieces

        # run rails scaffold that includes some of the ember pieces due to ember_rails gem
        generate 'scaffold', "#{name} #{model_attributes.join(' ')}" 

        # update router
        append_file 'app/assets/javascripts/router.js.em', "  @resource '#{name_plural}', ->    \n"
        append_file 'app/assets/javascripts/router.js.em', "    @route 'new', { path: '/new' }\n"
        append_file 'app/assets/javascripts/router.js.em', "    @resource '#{name_singular}', { path: '/:#{name_singular}_id' }, ->  \n"
        
        # create ember routes
        template 'routes/routes.js.em', "app/assets/javascripts/routes/#{name_plural}_route.js.em"
        template 'routes/route_new.js.em', "app/assets/javascripts/routes/#{name_plural}_new_route.js.em"
        template 'routes/route.js.em', "app/assets/javascripts/routes/#{name_singular}_route.js.em"

        # create ember base controllers
        template 'controllers/object_controller_base.js.em', "app/assets/javascripts/controllers/base/object_controller_base.js.em"
        template 'controllers/array_controller_base.js.em', "app/assets/javascripts/controllers/base/array_controller_base.js.em"

        # create ember controllers
        template 'controllers/controllers.js.em', "app/assets/javascripts/controllers/#{name_plural}_controller.js.em"
        template 'controllers/controllers_new.js.em', "app/assets/javascripts/controllers/#{name_plural}_new_controller.js.em"
        template 'controllers/controller.js.em', "app/assets/javascripts/controllers/#{name_singular}_controller.js.em"

        # create ember templates


        generate 'ember:template', "#{name_plural}"
        generate 'ember:template', "#{name_plural}/index"
        generate 'ember:template', "#{name_plural}/new"
        generate 'ember:template', "#{name_singular}"
        generate 'ember:template', "#{name_singular}/_show"
        generate 'ember:template', "#{name_singular}/_edit"

      end

      private

      def application_name
        Rails.configuration.ember.app_name
      end

      def name_plural
        name.downcase.pluralize
      end

      def name_singular   
        name.downcase.singularize     
      end

    end

  end
end
