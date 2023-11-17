// Thêm "active" vào sidebar-list-item dựa vào chỉ số trang
const sidebarListItems = document.querySelectorAll('.sidebar-list-item');
sidebarListItems[1].classList.add('active');

var newMemberAddBtn = document.querySelector('.addBtn'),
    darkBg = document.querySelector('.dark_bg'),
    popupForm = document.querySelector('.popup'),
    crossBtn = document.querySelector('.closeBtn'),
    imgInput = document.querySelector('.img'),
    imgHolder = document.querySelector('.imgholder'),
    form = document.querySelector('form'),
    formInputFields = document.querySelectorAll('form input'),
    uploadimg = document.querySelector("#uploadimg")


let isEdit = false,
    editId

newMemberAddBtn.addEventListener('click', () => {
    isEdit = false
    imgInput.src = "../imgs/admin/pic1.png"
    darkBg.classList.add('active')
    popupForm.classList.add('active')
})

crossBtn.addEventListener('click', () => {
    darkBg.classList.remove('active')
    popupForm.classList.remove('active')
    form.reset()
})

uploadimg.onchange = function () {
    if (uploadimg.files[0].size < 1000000) { // 1MB = 1000000
        var fileReader = new FileReader()

        fileReader.onload = function (e) {
            var imgUrl = e.target.result
            imgInput.src = imgUrl
        }

        fileReader.readAsDataURL(uploadimg.files[0])
    } else {
        alert("This file is too large!")
    }

}