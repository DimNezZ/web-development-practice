console.log('Книги');
function showBook(){

    console.log(`Название - ${this.title}; Год публикации - ${this.pubYear}; Цена - ${this.price}`);

 

}


let book2 = {
    title: "Война и мир",
    pubYear: 1865,
    price: 5000,
    show() {
        console.log(`Название - ${this.title}; Год публикации - ${this.pubYear}; Цена - ${this.price}`);
    
}
}

let book1 = {
    title: "Как выжить на карантине",
    pubYear: 2020,
    price: 3000,
    show: showBook 
    
};
book1.show();
book2.show();
