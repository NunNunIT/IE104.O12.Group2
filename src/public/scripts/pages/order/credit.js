// Đổi ảnh khi nhập các trường thông tin mặt sau thẻ
function updateCardImage() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_back_vi.png";
}

// Đổi ảnh khi nhập các trường thông tin mặt trước thẻ
function normalCardImage() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_vi.png";

  var numberCardLabel1 = document.querySelector(".input_box--top label");
  numberCardLabel1.style.color = "white";
  if (numberCardInput1.value.trim() !== "") {
    numberCardLabel1.style.color = "white";
  }

  if (numberCardInput1.value.trim() !== "") {
    numberCardLabel2.style.color = "white";
  }
}

// Đổi ảnh khi nhập các trường thông tin mặt sau thẻ
function inputInfor() {
  var cardImage = document.querySelector(".input_right img");
  cardImage.src = "/imgs/transaction/card_vi.png";
}

function revertLabelColor() {
  // Revert the label color to normal when the input loses focus (blur event)
  var numberCardInput1 = document.getElementById("NumberCard");
  var numberCardLabel1 = document.querySelector(".input_box--top label");

  if (numberCardInput1.value.trim() === "") {
    numberCardLabel1.style.color = "var(--dark-gray-o50)"; // Revert to normal color if the input is empty
  }
}

function handleDocumentClick(event) {
  // Check if the clicked element is not the NumberCard input
  if (event.target.id !== "NumberCard") {
    // Revert the label color to normal when clicking outside the input
    revertLabelColor();
  }
}

// Attach the revertLabelColor function to the blur event of the input
document
  .getElementById("NumberCard")
  .addEventListener("blur", revertLabelColor);
// Attach the revertLabelColor function to the focus event of other inputs
document.getElementById("EndDate").addEventListener("focus", revertLabelColor);
document.getElementById("CSC").addEventListener("focus", revertLabelColor);

// Attach the handleDocumentClick function to the click event on the document
document.addEventListener("click", handleDocumentClick);
