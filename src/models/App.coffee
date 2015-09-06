# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'bust' , => @trigger 'dealerWin'
    @get('playerHand').on 'stand', => @get('dealerHand').playToWin()
    
    @get('dealerHand').on 'bust' , => @trigger 'playerWin'
    @get('dealerHand').on 'stand', => @trigger @decideWinner()


  decideWinner: ->
    if @get('playerHand').maxScore() > @get('dealerHand').maxScore()
      'playerWin'
    else if @get('playerHand').maxScore() < @get('dealerHand').maxScore()
      'dealerWin'
    else
      'push'
