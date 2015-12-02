`import Ember from 'ember'`

ScoreDetailModalComponent = Ember.Component.extend
  actions:
    close: ->
      @set 'isOpen', false
      return false
    deletePart: (part) ->
      @sendAction('deletePart', @get('score'), part)

`export default ScoreDetailModalComponent`
