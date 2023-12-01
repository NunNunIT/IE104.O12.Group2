// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[1].classList.add('active');


// Định nghĩa hàm để thêm class cho các phần tử purchase-item__status và purchase-item__status-container
function addStatusClasses() {
    // Lấy tất cả các phần tử có class "purchase-item__status-container"
    let statusContainers = document.querySelectorAll(".purchase-item__status-container");

    // Lặp qua mỗi phần tử và thực hiện kiểm tra và thêm class
    statusContainers.forEach(function (container) {
        let statusElement = container.querySelector(".purchase-item__status");
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


document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các liên kết trong thẻ nav có class "purchase__status"
    var statusLinks = document.querySelectorAll(".purchase__status a");

    // Xác định URL hiện tại và giải mã
    var currentUrl = decodeURIComponent(window.location.href);

    // Cập nhật class "active" dựa trên URL hiện tại
    updateActiveLink(statusLinks, currentUrl);

    // Thêm sự kiện cho sự thay đổi trạng thái trang (như khi chuyển trang)
    window.addEventListener("popstate", function () {
        // Xác định URL mới và giải mã
        var newUrl = decodeURIComponent(window.location.href);

        // Cập nhật class "active" dựa trên URL mới
        updateActiveLink(statusLinks, newUrl);
    });
});

// Hàm để cập nhật class "active" dựa trên URL
function updateActiveLink(links, url) {
    for (var i = 0; i < links.length; i++) {
        var link = links[i];
        var linkUrl = decodeURIComponent(link.href);

        if (url === linkUrl) {
            // Nếu liên kết có URL trùng khớp với URL hiện tại, thêm class "active"
            link.classList.add("active");
        } else {
            // Nếu không phải liên kết được chọn, loại bỏ class "active"
            link.classList.remove("active");
        }
    }
}





