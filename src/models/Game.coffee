class window.Game extends Backbone.Model
  initialize: ->
    console.log('what')
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

