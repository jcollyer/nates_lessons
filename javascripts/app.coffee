window.App = Ember.Application.create()

App.Store = DS.Store.extend
  revision: 12
  adapter: 'DS.FixtureAdapter'

App.Router.map ->
  @resource "home"
  @resource "about"
  @resource "lessons", { path: "lessons" }
  @resource "lessonshow", { path: "lessonshow/:lesson_id"}


App.LessonsRoute = Ember.Route.extend
  model: ->
    App.Lesson.find()


App.Lesson = DS.Model.extend
  title: DS.attr('string')
  summary: DS.attr('string')
  imageUrl: DS.attr('string')
  createdAt: DS.attr('date')

Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()

App.Lesson.FIXTURES = [
  {
    id: 1
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 2
    title: "Into the belly of the whale"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 3
    title: "Jeremiah gets down"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 4
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 5
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 6
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 7
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
  {
    id: 8
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
  }
]
