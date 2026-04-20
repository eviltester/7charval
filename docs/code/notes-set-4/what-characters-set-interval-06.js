setInterval(
    function(){
        console.log("[" +
            document.querySelector(
                     "[name='characters']").value +
                    "] " + 
             document.querySelector("[name='characters']").value.length
        )
    },500)

