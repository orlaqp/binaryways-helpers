# For more information see: http://emberjs.com/guides/routing/

class <%= application_name %>.<%= name_plural.capitalize %>Route extends Ember.Route

  model: ->
    @store.find('<%= name_singular %>')