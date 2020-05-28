console.log("Конструктор Book");

function Book (title, pubYear, price){
    this.title= title;
    this.pubYear= pubYear;
    this.price= price;
}
Book.prototype.show = function (){
    console.log( this.title);
    console.log( this.pubYear);
    console.log( this.price);
}
 
let book3 = new Book ('Книга', 1999, 4350);
book3.show();
