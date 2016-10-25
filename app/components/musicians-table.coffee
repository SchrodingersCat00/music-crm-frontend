`import Ember from 'ember'`

MusiciansTableComponent = Ember.Component.extend
  rows: Ember.computed.alias 'musicians'
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  actions:
    delete: (contacts) ->
      contacts.setEach('isSelected', false)            
      @sendAction('delete', contacts)

`export default MusiciansTableComponent`
