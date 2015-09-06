assert = chai.assert

describe " constructor", ->

  it "should calculate the winner properly", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52


describe 'app', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.last(), hand.hit()
