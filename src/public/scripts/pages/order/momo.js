document.addEventListener("DOMContentLoaded", function () {
  const cancelButtons = document.querySelectorAll(".momo_left-cancel");

  cancelButtons.forEach(function (cancelButton) {
    cancelButton.addEventListener("click", function () {
      window.location.href =
        "http://localhost:3000/account/purchase?order_status=Ch%E1%BB%9D%20thanh%20to%C3%A1n";
    });
  });
});
