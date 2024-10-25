function hi(name, fnGreet) {
  return `hi ${name}. Good ${fnGreet()}`
}

fnMorning = () => "Morning!!!"
//function fnMorning() {
//  return "Morning!!!"
//}

res = hi("pras", fnMorning);
console.log(res);

res = hi("pras", function() {
  return "Evening!"
});
console.log(res);
