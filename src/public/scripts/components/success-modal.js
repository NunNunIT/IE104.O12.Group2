const background = document.querySelector('.success-modal__background')
const closeBtn = document.querySelector('.succes-modal__close')

function closeSuccessModal() {
    const successModal = document.querySelector('.success-modal')
    successModal.style.display = 'none'
}

background.addEventListener('click', closeSuccessModal)
closeBtn.addEventListener('click', closeSuccessModal)