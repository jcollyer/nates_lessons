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

App.HomeRoute = Ember.Route.extend
  model: ->
    App.Lesson.find()

App.Lesson = DS.Model.extend
  title: DS.attr('string')
  summary: DS.attr('string')
  imageUrl: DS.attr('string')
  createdAt: DS.attr('date')
  mp3: DS.attr('sring')

Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()

App.Lesson.FIXTURES = [
  {
    id: 1
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 2
    title: "Into the belly of the whale"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 3
    title: "Jeremiah gets down"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 4
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 5
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 6
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 7
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
  {
    id: 8
    title: "Crying out to God"
    summary: "A studie in psalms of King David seeking God."
    imageUrl: "/images/crying_out_to_god.jpg"
    createdAt: new Date('12-22-2012')
    mp3: "/mp3/1.mp3"
  }
]

$ ->
  $(document).on "click", ".play_button",  ->
    audioPlayer = $("#lesson_mod_menu")
    console.log audioPlayer
    audioPlayer.css display: 'block'
    $button = $(this)
    mediaPath =  $button.text()
    window.player = $("#jquery_jplayer_1").jPlayer
      swfPath: "http://jplayer.org/latest/js"
      supplied: "mp3, oga"
      ready: ->
        player.bind $.jPlayer.event.play, ->
          console.log "play event"
          $button.removeClass "paused"
        player.bind $.jPlayer.event.pause, ->
          console.log "pause event"
          $button.addClass "paused"

    if $button.data("state") == "playing"
      console.log "clicked pause"
      player.jPlayer "pause"
      $button.data "state", "paused"
    else
      console.log "clicked play"
      player.jPlayer "setMedia", {
        mp3: mediaPath
      }
      player.jPlayer "play"
      $button.data "state", "playing"
      $button.removeClass "paused"


