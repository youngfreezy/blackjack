// Generated by CoffeeScript 1.10.0
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

window.Bet = (function(superClass) {
  extend(Bet, superClass);

  function Bet() {
    return Bet.__super__.constructor.apply(this, arguments);
  }

  Bet.prototype.initialize = function() {
    return this.set({
      cash: 100,
      bet: 0
    });
  };

  Bet.prototype.placeBet = function(bet) {
    if (!bet) {
      return;
    }
    if (bet > 0 && bet <= this.get('cash')) {
      this.set('cash', this.get('cash') - bet);
      return this.set('bet', bet);
    }
  };

  Bet.prototype.updateCash = function(winner) {
    if (winner === 'Player') {
      this.set('cash', this.get('cash') * this.get('bet'));
    }
    if (winner === 'Push') {
      this.set('cash', this.get('cash') + (this.get('bet')));
    }
    if (this.get('cash') === 0) {
      alert("you lose!");
      this.set('cash', 100);
    }
    return this.set('bet', 0);
  };

  return Bet;

})(Backbone.Model);
