const modalBtn = document.querySelectorAll('.btn-logout')
const modal = document.querySelectorAll('.sidebar-account__popup')
const closeBtn = document.querySelectorAll('.btn-close')
const cancelBtn = document.querySelectorAll('.btn-cancel')

modalBtn.forEach((btn) => {
    btn.onclick = function () {
        modal[0].style.display = 'flex'
    }
})

// Đóng popup khi chọn dấu x
closeBtn.forEach((closeBtn) => {
    closeBtn.onclick = function () {
        modal[0].style.display = 'none'
    }
})

// Đóng sidebar-account__popup khi chọn nút hủy
cancelBtn.forEach((cancelBtn) => {
    cancelBtn.onclick = function () {
        modal[0].style.display = 'none'
    }
})

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
    modal.forEach((modal) => {
        if (e.target == modal) {
            modal.style.display = 'none'
        }
    })
}