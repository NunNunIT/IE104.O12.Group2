const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item => {
    const li = item.parentElement;

    item.addEventListener('click', function () {
        allSideMenu.forEach(i => {
            i.parentElement.classList.remove('active');
        })
        li.classList.add('active');
    })
});


// // TOGGLE SIDEBAR
// const menuBar = document.querySelector('#content nav .material-symbols-outlined');
// const sidebar = document.getElementById('sidebar');

// menuBar.addEventListener('click', function () {
//     sidebar.classList.toggle('hide');
// })


// // show profile
// // Giả sử đã có dữ liệu từ cơ sở dữ liệu
// const profileData = {
//     username: 'john_doe',
//     fullname: 'John Doe',
//     birthdate: '01/15/1990',
//     gender: 'Nam',
//     email: 'john@example.com',
//     phone: '123-456-7890',
//     address: '123 Main St, City, Country',
//     registrationDate: '10/01/2023',
//     accountStatus: 'Hoạt động',
// };

// document.getElementById('username').textContent = profileData.username;
// document.getElementById('fullname').textContent = profileData.fullname;
// document.getElementById('birthdate').textContent = profileData.birthdate;
// document.getElementById('gender').textContent = profileData.gender;
// document.getElementById('email').textContent = profileData.email;
// document.getElementById('phone').textContent = profileData.phone;
// document.getElementById('address').textContent = profileData.address;
// document.getElementById('registration-date').textContent = profileData.registrationDate;
// document.getElementById('account-status').textContent = profileData.accountStatus;


// document.querySelector('.logout').addEventListener('click', function () {
//     // Ẩn nội dung thông tin cá nhân
//     document.querySelector('.info').style.display = 'none';
//     // Hiển thị nội dung trang đăng xuất
//     document.querySelector('.logout-content').style.display = 'block';
// });

// document.getElementById('cancel-button').addEventListener('click', function () {
//     // Hiển thị lại nội dung thông tin cá nhân và ẩn nội dung trang đăng xuất khi hủy
//     document.querySelector('.info').style.display = 'block';
//     document.querySelector('.logout-content').style.display = 'none';
// });

// document.getElementById('confirm-button').addEventListener('click', function () {
//     // Thực hiện đăng xuất (có thể thực hiện các hành động đăng xuất khác)
//     alert('Bạn đã đăng xuất thành công.');
//     // Có thể thêm mã để chuyển đến trang đăng xuất
// });


// // Lấy tham chiếu đến các phần tử
// const infoLink = document.getElementById('info-link');
// const infoContent = document.querySelector('.info');
// const logoutContent = document.querySelector('.logout-content');

// // Đặt sự kiện khi nhấn vào "Thông tin cá nhân"
// infoLink.addEventListener('click', function (e) {
//     // e.preventDefault(); // Ngăn chuyển hướng đến href của liên kết

//     // Hiển thị nội dung thông tin cá nhân và ẩn nội dung trang đăng xuất
//     infoContent.style.display = 'block';
//     logoutContent.style.display = 'none';
// });


const allStatus = document.querySelectorAll('.purchase__status a');
console.log(allStatus)

allStatus.forEach(item => {
    item.addEventListener('click', function () {
        // Loại bỏ lớp "active" từ tất cả các phần tử
        allStatus.forEach(i => {
            i.classList.remove('active');
        });

        // Thêm lớp "active" cho phần tử được chọn
        item.classList.add('active');
    });
});

// Mặc định, thêm lớp "active" cho phần tử đầu tiên
allStatus[0].classList.add('active');

