import Ember from 'ember'

_genres = ['classic', 'light']
_instruments = ['soprano', 'cornet', 'flugelhorn', 'althorn', 'bariton', 'trombone', 'euphonium', 'bass_eb', 'bass_bb', 'percussion', 'conductor']
_instrumentParts = ['solo', '1st', '2nd', '3th', 'repiano', 'bas']

export default Ember.Service.extend
  genres: () -> _genres
  instruments: () -> _instruments
  instrumentParts: () -> _instrumentParts
  sortInstrumentParts: (parts) ->
    sortedParts = parts.slice(0) # make a copy of the array
    sortedParts.sort (a, b) ->
      sort = _instruments.indexOf(a.get('instrument')) - _instruments.indexOf(b.get('instrument'))
      if sort == 0
        sort = _instrumentParts.indexOf(a.get('instrumentPart')) - _instrumentParts.indexOf(b.get('instrumentPart'))
      return sort
    sortedParts
