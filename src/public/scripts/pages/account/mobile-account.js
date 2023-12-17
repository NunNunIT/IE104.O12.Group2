// Thêm "active" vào app-bar__element
const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

document.addEventListener('DOMContentLoaded', function() {
    var topMenuItems = document.querySelectorAll('.side-menu.top li');

    topMenuItems.forEach(function(item) {
        item.addEventListener('click', function() {
            topMenuItems.forEach(function(otherItem) {
                otherItem.classList.remove('focus');
            });

            item.classList.add('focus');
        });
    });
});


//Popup
const modalBtns = document.querySelectorAll('.btn-warranty')
const modals = document.querySelectorAll('.mobile-account__popup')
const closeBtns = document.querySelectorAll('.close-btn')
const cancelBtns = document.querySelectorAll('.btn-cancel')

modalBtns.forEach((btn) => {
    btn.onclick = function () {
        modals[0].style.display = 'block'
    }
})

// Đóng popup khi chọn dấu x
closeBtns.forEach((closeBtn) => {
    closeBtn.onclick = function () {
        modals[0].style.display = 'none'
    }
})

// Đóng popup khi chọn nút hủy
cancelBtns.forEach((cancelBtn) => {
    cancelBtn.onclick = function () {
        modals[0].style.display = 'none'
    }
})

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
    modals.forEach((modal) => {
        if (e.target.closest('.mobile-account__popup') == modal) {
            modal.style.display = 'none';
        }
    });
};
