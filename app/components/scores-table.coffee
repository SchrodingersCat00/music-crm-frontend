`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  store: Ember.inject.service()
  selectedScores: Ember.computed.filterBy('scores', 'isSelected', true)
  selectedScoresIsEmpty: Ember.computed 'selectedScores', ->
    @get('selectedScores').get('length') == 0
  actions:
    toggleArchive: ->
      scores = @get('selectedScores')
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, isSelected: false } )
          score.save()
    delete: () ->
      scores = @get('selectedScores')
      @sendAction('delete', scores)
    openDetail: (score) ->
      @set('selectedScore', score)
      @set('detailIsOpen', true)
    openNewMusicPart: (score) ->
      musicPart = @get('store').createRecord('part', {})
      @set('selectedScore', score)
      @set('newMusicPart', musicPart)
      @set('newMusicPartIsOpen', true)
    addFile: (file, part) ->
      @sendAction('addFile', file, part)
    savePart: (score, part) ->
      @sendAction('savePart', score, part)
    deletePart: (score, part) ->
      @sendAction('deletePart', score, part)

`export default ScoresTableComponent`
