console.log("Функция power");
        function power(num, exp){
            let result = 1;
        for(let i = 0; i <exp; i++)
        {
            result = result * num;
        }
        return(result);
    }
    console.log(power(2,10));