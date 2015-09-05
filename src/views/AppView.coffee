class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    #listens for DOM click event on the stand class button, calls stand on the player hand
    'click .stand-button': -> @model.get('playerHand').stand()
    #'click .stand-button': -> @model.get('dealerHand').stand()
  initialize: ->
    @render()
    

  render: ->
    @$el.children().detach()
    @$el.html @template()

    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el

