
  //sidebar
  const links = document.querySelectorAll('#sidebar a');

  links.forEach(function (link) {
      link.addEventListener('click', function () {
          links.forEach(function (otherLink) {
              otherLink.parentNode.classList.remove('active');
          });
  
          link.parentNode.classList.add('active');
      });
  });
  
    function redirectTo(url) {
      window.location.href = url;
    }
  
  //Popup
  const modalBtns = document.querySelectorAll('.btn-warranty')
  const modals = document.querySelectorAll('.popup')
  const closeBtns = document.querySelectorAll('.close-btn')
  const cancelBtns = document.querySelectorAll('.btn-cancel')
  
  modalBtns.forEach((btn) => {
      btn.onclick = function () {
          modals[0].style.display = 'block'
      }
  })
  
  // Đóng popup khi chọn dấu x
  closeBtns.forEach((closeBtn) => {
      closeBtn.onclick = function () {
          modals[0].style.display = 'none'
      }
  })
  
  // Đóng popup khi chọn nút hủy
  cancelBtns.forEach((cancelBtn) => {
      cancelBtn.onclick = function () {
          modals[0].style.display = 'none'
      }
  })
  
  // Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
  window.onclick = function (e) {
      modals.forEach((modal) => {
          if (e.target == modal) {
              modal.style.display = 'none'
          }
      })
  }