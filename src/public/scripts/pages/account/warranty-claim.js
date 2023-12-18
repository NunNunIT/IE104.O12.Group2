const appbar__element = document.querySelectorAll(".side-menu__ele");
appbar__element[2].classList.add("active");

const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

// Popup
const warrantyBtns = Array.from(document.querySelectorAll(".btn-warranty"));
const warrantyPopups = Array.from(document.querySelectorAll(".popup-warranty"));
const warrantyCloseBtns = Array.from(document.querySelectorAll(".close-btn"));
const warrantyCancelBtns = Array.from(document.querySelectorAll(".btn-cancel"));

warrantyBtns.forEach((btn) => {
  btn.addEventListener("click", (event) => {
    // warrantyPopups[index].style.display = 'block'
    const current = event.currentTarget;
    const warrantyPopup = current.nextElementSibling;
    warrantyPopup.style.display = "block";
  });
});

// Đóng popup khi chọn dấu x
warrantyCloseBtns.forEach((closeBtn) => {
  closeBtn.addEventListener("click", (event) => {
    const current = event.currentTarget;
    const warrantyPopup =
      current.parentElement.parentElement.parentElement.parentElement
        .parentElement;
    warrantyPopup.style.display = "none";
  });
});

// Đóng popup khi chọn nút hủy
warrantyCancelBtns.forEach((cancelBtn) => {
  cancelBtn.addEventListener("click", (event) => {
    const current = event.currentTarget;
    const warrantyPopup =
      current.parentElement.parentElement.parentElement.parentElement
        .parentElement;
    warrantyPopup.style.display = "none";
  });
});

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.addEventListener("click", (event) => {
  warrantyPopups.forEach((modal) => {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  });
});

// Nút submit
const warrantyForms = Array.from(document.querySelectorAll(".warranty-form"));
warrantyForms.forEach((form) => {
  form.addEventListener("submit", (event) => {
    event.preventDefault();
    const successPopup = document.querySelector(".success-modal");
    const warrantyPopup = form.parentElement.parentElement.parentElement;
    warrantyPopup.style.display = "none";
    successPopup.style.display = "flex";
    setTimeout(() => (successPopup.style.display = "none"), 1500);
  });
});
