const pay = () => {
  Payjp.setPublicKey("pk_test_9e9fc272d80c517f0d499d5a");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_addres[number]"),
      exp_month: formData.get("order_addres[exp_month]"),
      exp_year: `20${formData.get("order_addres[exp_year]")}`,
      cvc: formData.get("order_addres[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }
    });
  });
};

window.addEventListener("load", pay);