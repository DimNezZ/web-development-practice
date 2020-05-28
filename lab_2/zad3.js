console.log('Первый загланый символ');
function ucfirst(stroka1){
    let stroka2 = stroka1.split(' ');
    let stroka3 = '';
for (let i = 0; i < stroka2.length; i++) {
    let Zagl = stroka2[i].substring(0, 1).toUpperCase();
    let NeZagl = stroka2[i].substring(1, stroka2[i].length);
stroka3 =stroka3 + Zagl + NeZagl + ' ';
};
console.log(stroka3);
    }
ucfirst("ехал грека через реку, видит грека — в реке рак. сунул грека руку в реку, рак за руку греку — цап!  ");