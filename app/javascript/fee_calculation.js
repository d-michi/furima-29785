// $(function(){
//   $("#price").on('keyup', function(){
//     console.log(111)
//     var price = $("#price").val(); //100
//     var fee = Math.floor(price * 0.1); //10
//     var profit = (price - fee); //90
//     $(".add-tax-price").text(fee);
//     $(".profit").text(profit);
//     $(".add-tax-price").text('');
//     $(".profit").text('');
//   })
// });

window.addEventListener("DOMContentLoaded", () => {
  const price = document.getElementById("price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  price.addEventListener("input", () => {
    const inputValue = document.getElementById("price").value; //100
    const fee = Math.floor(inputValue * 0.1); //10
    const profit = (inputValue - fee); //90

    addTaxDom.innerHTML = fee ;
    profitDom.innerHTML = profit ;
  })
});