class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @on 'hit', -> 
      for score in @model.get('game').get('playerHand')
        console.log("got here")
        if score > 21 
          alert("You lost!")
      
