class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

    @trigger 'bust' if @busted()
    @last()


  stand: -> @trigger 'stand'

  playToWin: ->
    @first().flip()
    @hit() while @scores()[0] < 17
    @stand() if !@busted()

  busted: -> @maxScore() > 21
  
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


  maxScore: -> if @scores()[1] <= 21 then @scores()[1] else @scores()[0]
