console.log('Квадрат массива');
let a = [5, 12];
let b = [];
a[99] = 7;
for (let x in a) {
b = Math.pow(a[x], 2);
console.log(b);
}
for (let i = 0; a.length > i; i++) {
    if (!isNaN(a[i])) {
    console.log(Math.pow(a[i], 2))
    }
    }