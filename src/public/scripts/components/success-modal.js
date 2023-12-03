const background = document.querySelector('.success-modal__background')

function closeSuccessModal() {
    const successModal = document.querySelector('.success-modal')
    successModal.style.display = 'none'
}

background.addEventListener('click', closeSuccessModal)