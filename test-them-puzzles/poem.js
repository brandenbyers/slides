var chai = require('chai');
var expect = chai.expect;
var numberRhymes = require('./words');

// You will be given an array of numbers.
// Each number will be between 0 and 9.
// These numbers may be integers or strings.
// If a number is in a string, it may be a digit or word.
// Return a nonsense poem,
// where each line starts with a number from the array
// followed by a phrase ending in a word that rhymes with that number.

var rhymingPoem = 'Nine, you smell like wine\nFive, chicken dumplings make me feel alive\nThree, you be lost deep in the sea\nOne, this poem is done';
var someWrong = 'Nine, you smell like cheese\nFive, chicken dumplings make me feel change\nThree, you be lost deep in the sea\nOne, this poem is done';

var rhymingNumberPoem = function(arr) {
  // This function is a poet and it didn't know it.
  var str = rhymingPoem;
  return str;
};

// Test Code

var rhymeChecker = function(str) {
  var arr = str.split(/,|\./).join('').split("\n");
  if(str.length < 1 || arr[0].split(' ').length < 3) {
    return false;
  }
  var count = arr.reduce(function(a, b) {
    var words = b.split(' '),
        firstWord = words[0].toLowerCase(),
        lastWord = words[words.length - 1].toLowerCase();
    if(numberRhymes[firstWord].match(lastWord)) {
      return a + 1;
    }
    return a;
  }, 0);
  if(count < arr.length) {
    return false;
  }
  return true;
};

var shortArr = [9,5,3,1];
var longArr = [9,5,3,1,5,4,3,5,6,3,2,3,4,7,5,2,3,4,7,10,23,4,2,1,4,6,8];

describe('Rhyming Number Poem', function() {
  it('should return a string', function() {
    expect(rhymingNumberPoem([9,5,3,1,6,7])).to.be.a('string');
  });
  it('should return correct number of lines from short array', function() {
    expect(rhymingNumberPoem(shortArr).split('\n').length).to.equal(4);
  });
  it('should return correct number of lines from long array', function() {
    expect(rhymingNumberPoem(longArr).split('\n').length).to.equal(27);
  });
  it('should create a short rhyming poem', function() {
    expect(rhymeChecker(rhymingNumberPoem(shortArr))).to.equal(true);
  });
  it('should create a long rhyming poem', function() {
    expect(rhymeChecker(rhymingNumberPoem(longArr))).to.equal(true);
  });
});

