// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[1].classList.add('active');

// Định nghĩa hàm để thêm class cho các phần tử purchase-detail__status và purchase-detail__status-container
function addStatusClasses() {
    // Lấy tất cả các phần tử có class "purchase-detail__status-container"
    let statusContainers = document.querySelectorAll(".purchase-detail__status-container");

    // Lặp qua mỗi phần tử và thực hiện kiểm tra và thêm class
    statusContainers.forEach(function (container) {
        let statusElement = container.querySelector(".purchase-detail__status");
        let orderStatus = statusElement.textContent.trim();

        // Xóa tất cả các class cũ để tránh việc chúng tích tụ
        container.classList.remove("cancel", "unpaid", "finished", "delivering");

        if (orderStatus === "Đã hủy") {
            container.classList.add("cancel");
        } else if (orderStatus === "Chờ thanh toán") {
            container.classList.add("unpaid");
        } else if (orderStatus === "Hoàn thành") {
            container.classList.add("finished");
        } else if (orderStatus === "Đang giao hàng") {
            container.classList.add("delivering");
        }
    });
}

// Gọi hàm khi DOM đã được tải
document.addEventListener("DOMContentLoaded", function () {
    addStatusClasses();
});