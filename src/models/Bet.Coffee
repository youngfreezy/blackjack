class window.Bet extends Backbone.Model

  initialize: ->
    @set 
      cash: 100
      bet: 0

  placeBet: (bet)->
    if !bet then return

    if(bet>0 and bet<=@get 'cash')
      @set 'cash', @get('cash')-bet
      @set 'bet', bet
    
    

  updateCash: (winner) ->
    
    if(winner=='Player')
      @set 'cash', @get('cash')*@get 'bet'
    if(winner=='Push')
      @set 'cash', @get('cash')+ (@get 'bet')
    if(@get('cash')==0) 
      alert "you lose!"
      @set 'cash', 100
      
    @set 'bet', 0
#issues with triple equals?
