window.App = Ember.Application.create()

App.Router.map ->
  @resource "lessons", ->
    @resource "lesson", { path: ":lesson_id"}


# //
# King David's humanity

# A studie in psalms of King David seeking God

# 3 months ago

