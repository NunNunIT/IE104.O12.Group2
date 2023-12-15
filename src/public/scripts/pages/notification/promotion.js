//Điều hướng
const updateBtn = document.querySelector(".btn-update");
const promoBtn = document.querySelector(".btn-promo");
const useBtns = document.querySelectorAll(".btn-use");

const redirect2updateView = () => {
    window.location.href = "http://127.0.0.1:3000/notification/account-update";
}

const redirect2promoView = () => {
    window.location.href = "http://127.0.0.1:3000/notification/promotion";
}

const redirect2detailAccom = () => {
    window.location.href = "http://127.0.0.1:3000/search/detail"; // Sửa URL chuyển hướng tại đây
}

useBtns.forEach((btn) => {
    btn.addEventListener("click", redirect2detailAccom);
});

updateBtn.addEventListener("click", redirect2updateView);
promoBtn.addEventListener("click", redirect2promoView);


//Popup
const modalBtns = document.querySelectorAll(".popup-btn");
const modals = document.querySelectorAll(".popup");
const closeBtns = document.querySelectorAll(".close-btn");
const notiItems = document.querySelectorAll(".noti-item__block");
const markAllReadButton = document.querySelector(".btn-mark-all-read");
const popupVisible = new Array(modals.length).fill(false);

modalBtns.forEach((btn, index) => {
    btn.onclick = function () {
        modals[index].style.display = "block";
        popupVisible[index] = true;
        notiItems[index].style.backgroundColor = 'white'

        const noti_id = document.querySelector(`input[name = "noti ${index}"]`).value;

        fetch("/notifications/read-noti", {
            method: 'POST',
            body: JSON.stringify({
                noti_id: noti_id
            }),
            headers: {
                "Content-Type": "application/json",
            },
        })
    }
});

// Đóng popup khi chọn dấu x
closeBtns.forEach((closeBtn, index) => {
    closeBtn.onclick = function () {
        modals[index].style.display = "none";
        popupVisible[index] = false;
        if (popupVisible.some((visible) => visible)) {
        } else {
            notiItems[index].style.backgroundColor = "white"; //Đọc xong đổi màu nền
        }
    }
});

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
    modals.forEach((modal, index) => {
        if (e.target == modal) {
            modal.style.display = "none";
            popupVisible[index] = false;
            if (popupVisible.some((visible) => visible)) {
            } else {
                notiItems[index].style.backgroundColor = "white";
            }
        }
    });
}

// Đánh dấu đã đọc tất cả
markAllReadButton.addEventListener("click", () => {
    fetch("/notifications/read-all", {
        method: "POST",
        body: JSON.stringify({
            noti_type: 2
        }),
        headers: {
            "Content-Type": "application/json",
        },
    })

    notiItems.forEach((item) => {
        item.classList.add("read");
        item.style.backgroundColor = "white"; //Đổi màu nền
    });

    // Vô hiệu hóa nút "Đánh dấu tất cả là đã đọc"
    markAllReadButton.disabled = true;
    markAllReadButton.style.color = "gray";
    markAllReadButton.style.borderColor = "gray";
    markAllReadButton.style.cursor = "auto";
    markAllReadButton.style.boxShadow = "none";
})

