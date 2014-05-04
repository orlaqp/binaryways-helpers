class <%= application_name %>.ArrayControllerBase extends Ember.ArrayController

  filterString: ''
  filterAttributes: []

  +computed filterString
  filteredContent: ->
    self = @
    if not @filterString
      return @

    filterStringLower = @filterString.toLowerCase()
    self = @    
    @filter (item, index, enumerable) ->
      # search in all the filter attributes 
      isMatch = false
      self.filterAttributes.forEach (attr) ->
        if Ember.get(item, attr).toLowerCase().indexOf(filterStringLower) >= 0
          isMatch = true
          return
      
      isMatch
