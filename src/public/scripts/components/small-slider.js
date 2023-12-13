let slideIndex = 1
showSlides(slideIndex)

function changeSlide(n) {
  showSlides(slideIndex += n)
}

function currentSlide(n) {
  showSlides(slideIndex = n)
}

function updateCounter(n) {
  const totalSlides = document.querySelectorAll('.slides img').length
  const currentSlide = n
  const counter = document.querySelector('.slider-counter p')
  counter.textContent = `${currentSlide}/${totalSlides}`
}

function showSlides(n) {
  let i
  const slides = document.querySelectorAll('.slides img')
  const thumbnails = document.querySelectorAll('.thumbnails img')
  const counter = document.querySelector('.slider-counter')

  if (n > slides.length) {
    slideIndex = 1
  }
  if (n < 1) {
    slideIndex = slides.length
  }

  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none'
  }

  for (i = 0; i < thumbnails.length; i++) {
    thumbnails[i].className = thumbnails[i].className.replace(' active', '')
  }

  slides[slideIndex - 1].style.display = 'block'
  thumbnails[slideIndex - 1].className += 'active'

  for (i = 0; i < thumbnails.length; i++) {
    thumbnails[i].classList.remove('thumbnail-active') // Xóa lớp active từ tất cả các hình ảnh thumbnail
  }

  slides[slideIndex - 1].style.display = 'block'
  thumbnails[slideIndex - 1].classList.add('thumbnail-active') // Thêm lớp active cho hình ảnh thumbnail tương ứng

  // Gọi hàm updateCounter để cập nhật counter
  updateCounter(slideIndex)
}
