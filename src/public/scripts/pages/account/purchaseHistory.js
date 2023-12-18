// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele')
appbar__element[1].classList.add('active')

const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

// Định nghĩa hàm để thêm class cho các phần tử purchase-item__status và purchase-item__status-container
function addStatusClasses() {
    // Lấy tất cả các phần tử có class "purchase-item__status-container"
    let statusContainers = document.querySelectorAll(".purchase-item__status-container")

    // Lặp qua mỗi phần tử và thực hiện kiểm tra và thêm class
    statusContainers.forEach(function (container) {
        let statusElement = container.querySelector(".purchase-item__status")
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

document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các liên kết trong thẻ nav có class "purchase__status"
    let statusLinks = document.querySelectorAll(".purchase__status a")

    // Xác định URL hiện tại và giải mã
    let currentUrl = decodeURIComponent(window.location.href)

    // Cập nhật class "active" dựa trên URL hiện tại
    updateActiveLink(statusLinks, currentUrl)

    // Thêm sự kiện cho sự thay đổi trạng thái trang (như khi chuyển trang)
    window.addEventListener("popstate", function () {
        // Xác định URL mới và giải mã
        let newUrl = decodeURIComponent(window.location.href)

        // Cập nhật class "active" dựa trên URL mới
        updateActiveLink(statusLinks, newUrl)
    })
})

// Hàm để cập nhật class "active" dựa trên URL
function updateActiveLink(links, url) {
    for (let i = 0; i < links.length; i++) {
        let link = links[i]
        let linkUrl = decodeURIComponent(link.href)

        if (url === linkUrl) {
            // Nếu liên kết có URL trùng khớp với URL hiện tại, thêm class "active"
            link.classList.add("active")
        } else {
            // Nếu không phải liên kết được chọn, loại bỏ class "active"
            link.classList.remove("active")
        }
    }
}

// Thêm sự kiện click cho nút hủy mua hàng
const purchaseCancelBtns = document.querySelectorAll(".btn.btn--outlined.pri.cancel")
const purchaseCancelModals = document.querySelectorAll(".purchase-cancel__popup")
const cancelConfirmBtns = document.querySelectorAll(".btn.btn--filled.pri.confirm-cancel")
const purchaseCancelCloseBtns = document.querySelectorAll(".purchase-cancel__popup .close-btn")
const purchaseCancelConfirmBtns = document.querySelectorAll(".btn.btn--outlined.pri.cancel-purchase")
const cancelForms = document.querySelectorAll('.his_cancel_popup')


cancelForms.forEach(form => {
    form.addEventListener('submit', e => {
        e.preventDefault()
    })
})


purchaseCancelBtns.forEach((cancelBtn, index) => {
    cancelBtn.addEventListener("click", function () {
        purchaseCancelModals[index].style.display = "block"
        const order_id = {
            order_id: purchaseCancelModals[index].querySelector(`input[name=order_id]`).value
        }
        cancelConfirmBtns[index].addEventListener("click", function () {
            fetch('/order/cancel_order', {
                method: 'POST',
                body: JSON.stringify(order_id),
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then(res => res.json())
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

                        window.location.href = '/account/purchase?order_status=Đã%20hủy'
                        // location.reload()
                    }
                })
        })
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