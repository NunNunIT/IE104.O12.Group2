// Đổi ảnh khi nhập các trường thông tin mặt sau thẻ
function updateCardImage() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_back_vi.png";
}

// Đổi ảnh khi nhập các trường thông tin mặt trước thẻ
function normalCardImage() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_vi.png";
}

// Đổi ảnh khi nhập các trường thông tin mặt sau thẻ
function inputInfor() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_vi.png";
}
