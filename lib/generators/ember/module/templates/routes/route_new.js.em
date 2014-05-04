# For more information see: http://emberjs.com/guides/routing/

class <%= application_name %>.<%= name_plural.capitalize %>NewRoute extends App.AuthenticatedRoute

  model: ->
    @store.createRecord('<%= name_singular %>')
  
  
  actions:

    willTransition: (transition) ->      
      if @controller.isDirty
        if confirm 'If you continue without saving this record it will be lost. Do you want to continue?'
          @controller.model.deleteRecord()
        else
          transition.abort()

  
