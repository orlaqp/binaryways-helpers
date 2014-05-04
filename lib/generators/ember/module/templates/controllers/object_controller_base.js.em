class <%= application_name %>.ObjectControllerBase extends Ember.ObjectController

  isEditing: false
  
  +computed isValid
  canSave: ->      
    !@model.isValid

  stopEditing: ->    
    @isEditing = false
