const mocha = require("mocha");
const chai = require("chai");
const expect = chai.expect;

describe("Example Five", function() {

 it("should convert single digits", function() {
   expect(numberToRomanNumeral(1)).to.equal("I");
   expect(numberToRomanNumeral(4)).to.equal("IV");
   expect(numberToRomanNumeral(7)).to.equal("VII");
 });

 it("should convert double digits", function() {
   expect(numberToRomanNumeral(10)).to.equal("X");
   expect(numberToRomanNumeral(22)).to.equal("XXII");
   expect(numberToRomanNumeral(35)).to.equal("XXXV");
   expect(numberToRomanNumeral(59)).to.equal("LIX");
   expect(numberToRomanNumeral(99)).to.equal("XCIX");
  })

  it("should convert large numbers up to 3999", function() {
    expect(numberToRomanNumeral(3490)).to.equal("MMMCDXC");
    expect(numberToRomanNumeral(3999)).to.equal("MMMCMXCIX");
  })

  it("should convert large numbers up to 399999", function() {
    expect(numberToRomanNumeral(10090)).to.equal("X̅XC");
    expect(numberToRomanNumeral(399999)).to.equal("C̅C̅C̅X̅C̅MX̅CMXCIX");
  })

  it("should convert large numbers up to 3999999", function() {
    expect(numberToRomanNumeral(270100)).to.equal("C̅C̅L̅X̅X̅C");
    expect(numberToRomanNumeral(3999999)).to.equal("M̅M̅M̅C̅M̅X̅C̅MX̅CMXCIX");
  })

  it("should convert large numbers up to 39999999", function() {
    expect(numberToRomanNumeral(177102)).to.equal("C̅C̅L̅X̅X̅C");
    expect(numberToRomanNumeral(39999999)).to.equal("M̅M̅M̅C̅M̅X̅C̅MX̅CMXCIX");
  })

});

function numberToRomanNumeral(num) {
  var numeral = "";
  var arr = [
    [10000000,"X̿"],[9000000,"X̿M̅"],[5000000,"V̿"],[4000000,"M̅V̿"],

    [1000000,"M̅"],[900000,"C̅M̅"],[500000,"D̅"],[400000,"C̅D̅"],
    [100000,"C̅"],[90000,"X̅C̅"],[50000,"L̅"],[40000,"X̅L̅"],
    [10000,"X̅"],[9000,"MX̅"],[5000,"V̅"],[4000,"MV̅"],

    [1000,"M"],[900,"CM"],[500,"D"],[400,"CD"],
    [100,"C"],[90,"XC"],[50,"L"],[40,"XL"],
    [10,"X"],[9,"IX"],[5,"V"],[4,"IV"],
    [1,"I"]
  ];
  arr.map(val => {
    while (num - val[0] >= 0) {
      num -= val[0];
      numeral += val[1];
    }
  })
  return numeral;
}
