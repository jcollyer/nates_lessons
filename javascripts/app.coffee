window.App = Ember.Application.create()

App.Store = DS.Store.extend
  revision: 12
  adapter: 'DS.FixtureAdapter'

App.Router.map ->
  @resource "lessons", ->
    @resource "lesson", { path: ":lesson_id"}


App.Lesson = DS.Model.extend
  title: DS.attr('string')
  summary: DS.attr('string')
  imageUrl: DS.attr('string')
  createdAt: DS.attr('date')

Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()

App.Lesson.FIXTURES = [
  {
    id: 1,
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
]
