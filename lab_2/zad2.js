// function randomInteger(min, max) {
//     var rand = min + Math.random() * (max + 1 - min);
//     return Math.floor(rand);
//   }
//       console.log("Функция compare");
  
//       function compare(x,y){
//           if (x>y){
//               return true;
//               console.log (true);
//           }
//           else if (x<y) {
//               return false;
//               console.log (false);
//           }
//           else if (y===x){
//               return null;
//               console.log (null);
//           }
          
//       }
//       console.log(compare(randomInteger(1,8),randomInteger(1,8)));
      console.log("Функция compare");
function compare(x){
    return function(y){
    if (y>x) 
    console.log (true);
    if (y<x) 
    console.log (false); ;
    if (y==x) 
    console.log (null);
    }
    }
    var a=compare(50)
    a(60)