//エラーが出た場合はconsole.logで確認する console.log("test1")など
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