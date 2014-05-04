# for more details see: http://emberjs.com/guides/controllers/

class <%= application_name %>.<%= name_plural.capitalize %>NewController extends App.ObjectControllerBase

  actions: 

    doneEditing: ->
      self = @
      @model.save().then ->
        self.transitionToRoute '<%= name_singular %>', @model
      
    cancelEditing: ->   
      if @isDirty
        if confirm 'If you continue without saving this record your changes will be lost. Do you want to continue?'          
          @model.rollback()
          @transitionToRoute('<%= name_plural %>')   
      
    
    
