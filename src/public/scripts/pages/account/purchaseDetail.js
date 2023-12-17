// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele')
appbar__element[1].classList.add('active')

const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

// Định nghĩa hàm để thêm class cho các phần tử purchase-detail__status và purchase-detail__status-container
function addStatusClasses() {
    // Lấy tất cả các phần tử có class "purchase-detail__status-container"
    let statusContainers = document.querySelectorAll(".purchase-detail__status-container")

    // Lặp qua mỗi phần tử và thực hiện kiểm tra và thêm class
    statusContainers.forEach(function (container) {
        let statusElement = container.querySelector(".purchase-detail__status")
        let orderStatus = statusElement.textContent.trim()

        // Xóa tất cả các class cũ để tránh việc chúng tích tụ
        container.classList.remove("cancel", "unpaid", "finished", "delivering")

        if (orderStatus === "Đã hủy") {
            container.classList.add("cancel")
        } else if (orderStatus === "Chờ thanh toán") {
            container.classList.add("unpaid")
        } else if (orderStatus === "Hoàn thành") {
            container.classList.add("finished")
        } else if (orderStatus === "Đang giao hàng") {
            container.classList.add("delivering")
        }
    })
}

// Gọi hàm khi DOM đã được tải
document.addEventListener("DOMContentLoaded", function () {
    addStatusClasses()
})

// Thêm sự kiện click cho nút hủy mua hàng
const purchaseCancelBtns = document.querySelectorAll(".btn.btn--outlined.pri.cancel")
const purchaseCancelModals = document.querySelectorAll(".purchase-cancel__popup")
const purchaseCancelCloseBtns = document.querySelectorAll(".purchase-cancel__popup .close-btn")
const purchaseCancelConfirmBtns = document.querySelectorAll(".btn.btn--outlined.pri.cancel-purchase")

purchaseCancelBtns.forEach((cancelBtn, index) => {
    cancelBtn.addEventListener("click", function () {
        purchaseCancelModals[index].style.display = "block"
    })
})

// Đóng popup khi chọn dấu x
purchaseCancelCloseBtns.forEach((closeBtn, index) => {
    closeBtn.addEventListener("click", function () {
        purchaseCancelModals[index].style.display = "none"
    })
})

// Đóng popup khi chọn nút hủy
purchaseCancelConfirmBtns.forEach((closeBtn, index) => {
    closeBtn.addEventListener("click", function () {
        purchaseCancelModals[index].style.display = "none"
    })
})

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.addEventListener("click", function (e) {
    purchaseCancelModals.forEach((modal) => {
        if (e.target == modal) {
            modal.style.display = "none"
        }
    })
})

const cancelForm = document.getElementById('cancel_popup')

cancelForm.addEventListener('submit', e => {
    //Ngăn chặn việc gửi form nếu có bất kỳ trường nào không hợp lệ
    e.preventDefault()

    //Kiểm tra dữ liệu nhập vào
    const order_id = {
        order_id: document.querySelector('input[name=order_id]').value
    }

    fetch('/order/cancel_order', {
        method: 'POST',
        body: JSON.stringify(order_id),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json())
        .then(back => {
            if (back.status == "error") {
                window.alert('Vui lòng thử lại sau')
            }
            else if (back.status == "success") {
                const successModal = document.querySelector('.success-modal')
                successModal.style.display = 'flex'
                setTimeout(() => {
                    successModal.style.display = 'none'
                }, 1000)

                location.reload()
            }
        })
})