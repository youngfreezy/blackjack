class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    #takes a card off the deck and adds it to the current hand
    @add(@deck.pop())
    #  @last returns the last card in the hand
    @last()

  #stand method goes here - currently being called from appView.coffee click event
  stand: ->
    for score in @scores()
      if score > 21 
        #bad voodoo - shouldnt be controlling out of the model
        alert("You Lost!")
    

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    #adds the score of all cards in the hand, excluding the card this isn't 'revealed'
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


