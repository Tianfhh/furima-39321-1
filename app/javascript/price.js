window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const salesFeeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

 priceInput.addEventListener("input", () => {
  const price = parseFloat(priceInput.value);
  const salesFee = Math.floor(price * 0.1) || 0; 
  const profit = Math.floor(price - salesFee); 

  salesFeeDisplay.textContent = salesFee ? `${salesFee.toLocaleString()}円` : "";
  profitDisplay.textContent = profit ? `${profit.toLocaleString()}円` : "";
});

})


