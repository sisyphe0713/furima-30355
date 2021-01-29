function calculatePriceContent (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const calculatedPrice = itemPrice.value * 0.1;
    const calculatedProfit = itemPrice.value * 0.9;

    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${changeYen(calculatedPrice)}`;
    const profit  = document.getElementById("profit");
    profit.innerHTML = `${changeYen(calculatedProfit)}`;
  });
}

function changeYen(num){
  return Number(num).toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
}

window.addEventListener('load', calculatePriceContent);