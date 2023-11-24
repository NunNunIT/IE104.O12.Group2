document.addEventListener('DOMContentLoaded', function () {
    const logoutButton = document.querySelector('#logout-btn');
    const popup = document.querySelector('#logout-popup');
    const confirmButton = document.querySelector('#confirm-button');
    const cancelButton = document.querySelector('#cancel-button');
  
    // // Thêm mã để hiện thông tin cá nhân khi trang tải xong
    // document.getElementById('info').style.display = 'block';
  
    logoutButton.addEventListener('click', function () {
      // Ẩn thông tin cá nhân khi click vào nút "Đăng xuất"
      // document.getElementById('info').style.display = 'none';
      // Hiển thị popup form đăng xuất
      popup.style.display = 'block';
    });
  
    cancelButton.addEventListener('click', function () {
      // Hiển thị lại thông tin cá nhân khi click vào nút "Hủy" trong popup
      document.getElementById('info').style.display = 'block';
      // Ẩn popup form đăng xuất
      popup.style.display = 'none';
    });
  
    confirmButton.addEventListener('click', function () {
      // Thêm mã xử lý khi người dùng xác nhận đăng xuất
      // Ví dụ: window.location.href = 'logout.php';
    });
  });
  
  
  // Lắng nghe sự kiện click trên phần tử có class "popup"
  document.querySelector('.popup').addEventListener('click', function(event) {
    // Kiểm tra nếu phần tử được click không thuộc về phần tử con của logout-form
    if (!event.target.closest('.logout-form')) {
      // Đóng popup
      closeLogoutPopup();
    }
  });
  
  // Các hàm khác không thay đổi
  function openLogoutPopup() {
    var logoutPopup = document.getElementById('logout-popup');
    logoutPopup.style.display = 'block';
  }
  
  function closeLogoutPopup() {
    var logoutPopup = document.getElementById('logout-popup');
    logoutPopup.style.display = 'none';
  }
  
  function confirmLogout() {
    console.log('Đăng xuất thành công');
    closeLogoutPopup();
  }
  
  // Sự kiện nhấn nút "Đăng xuất"
  document.getElementById('confirm-button').addEventListener('click', confirmLogout);
  
  
  