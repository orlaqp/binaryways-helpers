# for more details see: http://emberjs.com/guides/controllers/

class <%= application_name %>.<%= name_plural.capitalize %>Controller extends App.ArrayControllerBase

  sortProperties: []

  # This property is defined in the base class and its value is used when filtering the array
  # this property should be bind to the filter control in the view
  # filterString: ''

  # these properties are used when applying a filter to the array controller
  filterAttributes: []
  