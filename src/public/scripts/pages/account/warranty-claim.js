const appbar__element = document.querySelectorAll(".side-menu__ele");
appbar__element[2].classList.add("active");

// Popup
const warrantyBtns = document.querySelectorAll(".btn-warranty");
const warrantyPopup = document.querySelectorAll(".popup-warranty");
const warrantyCloseBtn = document.querySelectorAll(".close-btn");
const warrantyCancelBtn = document.querySelectorAll(".btn-cancel");

warrantyBtns.forEach((btn) => {
  btn.onclick = function () {
    warrantyPopup[0].style.display = "block";
  };
});

// Đóng popup khi chọn dấu x
warrantyCloseBtn.forEach((closeBtn) => {
  closeBtn.onclick = function () {
    warrantyPopup[0].style.display = "none";
  };
});

// Đóng popup khi chọn nút hủy
warrantyCancelBtn.forEach((cancelBtn) => {
  cancelBtn.onclick = function () {
    warrantyPopup[0].style.display = "none";
  };
});

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
  warrantyPopup.forEach((modal) => {
    if (e.target == modal) {
      modal.style.display = "none";
    }
  });
};
