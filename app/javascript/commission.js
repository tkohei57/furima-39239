function commission () {
  const priceForm = document.getElementById("item-price");
  const priceCom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceForm.addEventListener("keyup", function () {
    const price = priceForm.value
    const calcCom = price / 10;
    const com = Math.floor(calcCom);
    const calcProfit = price - com;
    priceCom.innerHTML = `${com}`;
    profit.innerHTML = `${calcProfit}`;
  });
};

window.addEventListener("load", commission);

