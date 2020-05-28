console.log('Поиск слова');
let s = 'Мы знаем, что монохромный цвет - это градации серого';
let txt = 'хром';
let exp = new RegExp(txt, 'gi')
let words = s.split(/\s+/g);
let word = words.find(function (value) {
    return exp.test(value);
});
console.log(word);