# for more details see: http://emberjs.com/guides/controllers/

class <%= application_name %>.<%= name_singular.capitalize %>Controller extends App.ObjectControllerBase

  actions:

    edit: ->      
      @isEditing = true
      false

    doneEditing: ->  
      self = @    

      @model.save().then ->      
        self.isEditing = false
      
    cancelEditing: ->   
      if @isDirty
        if confirm 'If you continue without saving this record your changes will be lost. Do you want to continue?'          
          @model.rollback()
          @isEditing = false  
      else
        @isEditing = false 
  
    destroyRecord: ->
      if (window.confirm("Are you sure you want to delete this room?"))
        @get('model').destroyRecord().then ->
          @transitionToRoute '<%= name_plural %>'

        