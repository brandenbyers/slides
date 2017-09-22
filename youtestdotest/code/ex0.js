function numberToRomanNumeral(num) {
  var numeral = "";
  var arr = [
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

console.log(numberToRomanNumeral(7));
console.log(numberToRomanNumeral(23));
console.log(numberToRomanNumeral(777));
console.log(numberToRomanNumeral(1000));