# For more information see: http://emberjs.com/guides/routing/

class <%= application_name %>.<%= name_singular.capitalize %>Route extends App.AuthenticatedRoute
  
  model: (params) ->        
    @store.find('<%= name_singular %>', params.<%= name_singular %>_id)


  setupController: (controller, model) ->
    @_super.apply(this, arguments)

    # reset editing state
    # note: this is necessary here because `deactivate` won't be called when transitioning
    #       from one ContactRoute directly into another
    if (controller.get('isEditing'))      
      controller.stopEditing()
    
    # highlight this contact as active
    #@controllerFor('clients').set('activeClientId', model.get('id'))
  
  actions:

    willTransition: (transition) ->      
      if @controller.isDirty
        if confirm 'If you continue without saving this record it will be lost. Do you want to continue?'
          @controller.model.rollback()
          @controller.stopEditing()
        else
          transition.abort()

