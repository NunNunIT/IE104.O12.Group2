const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[2].classList.add('active');

//Popup
const openBtn = document.querySelectorAll('.btn-warranty')
const popup = document.querySelectorAll('.popup')
const closeBtn = document.querySelectorAll('.close-btn')
const cancelBtn = document.querySelectorAll('.btn-cancel')

// openBtn.forEach((btn) => {
//     btn.onclick = function () {
//         popup[0].style.display = 'block'
//     }
// })

// Đóng popup khi chọn dấu x
closeBtn.forEach((closeBtn) => {
    closeBtn.onclick = function () {
        popup[0].style.display = 'none'
    }
})

// Đóng popup khi chọn nút hủy
cancelBtn.forEach((cancelBtn) => {
    cancelBtn.onclick = function () {
        popup[0].style.display = 'none'
    }
})

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
    popup.forEach((modal) => {
        if (e.target == modal) {
            modal.style.display = 'none'
        }
    })
}