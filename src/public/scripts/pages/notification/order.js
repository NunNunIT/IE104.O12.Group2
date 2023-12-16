const modalBtns = document.querySelectorAll(".popup-btn");
const notiItemsRead = document.querySelectorAll(".noti-item__block.read");
const notiLength = document.querySelector('input[name = noti-length]').value
const modals = document.querySelectorAll(".popup");
const closeBtns = document.querySelectorAll(".close-btn");
const notiItems = document.querySelectorAll(".noti-item__block");
const markAllReadButton = document.querySelector(".btn-mark-all-read");
const popupVisible = new Array(modals.length).fill(false);

// Kiểm tra nếu tất cả thông báo đã được đọc
if (notiItemsRead.length == notiLength) {
    // Vô hiệu hóa nút "Đánh dấu tất cả là đã đọc"
    markAllReadButton.disabled = true;
    markAllReadButton.style.color = "gray";
    markAllReadButton.style.borderColor = "gray";
    markAllReadButton.style.cursor = "auto";
    markAllReadButton.style.boxShadow = "none";
}

// Lặp qua từng nút và gán sự kiện hiển thị pop-up
modalBtns.forEach((btn, index) => {
    btn.onclick = function () {
        modals[index].style.display = "block";
        popupVisible[index] = true;
        notiItems[index].style.backgroundColor = 'white'

        const noti_id = document.querySelector(`input[name = "noti ${index}"]`).value;

        fetch("/notification/read-noti", {
            method: 'POST',
            body: JSON.stringify({
                noti_id: noti_id
            }),
            headers: {
                "Content-Type": "application/json",
            },
        })
    };
});

// Lặp qua từng nút đóng và gán sự kiện đóng pop-up tương ứng
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


// Gán sự kiện đóng khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
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
    fetch("/notification/read-all", {
        method: "POST",
        body: JSON.stringify({
            noti_type: 1
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
