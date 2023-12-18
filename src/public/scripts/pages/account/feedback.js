const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

const allForm = document.querySelectorAll('.feedback-form-item');
allForm.forEach((form) => {
    const allStar = form.querySelectorAll('.rating .star')
    const ratingText = form.querySelector('.ratingText')

    allStar.forEach((item, idx) => {
        item.addEventListener('click', function (event) {
            let current = event.currentTarget
            let ratingInput = current.parentElement.querySelector('input')

            let click = 0
            ratingInput.value = idx % 5 + 1

            allStar.forEach(i => {
                i.classList.replace('bxs-star', 'bx-star')
                i.classList.remove('active')
            })

            for (let i = 0; i < allStar.length; i++) {
                if (i <= idx) {
                    allStar[i].classList.replace('bx-star', 'bxs-star')
                    allStar[i].classList.add('active')
                } else {
                    allStar[i].style.setProperty('--i', click)
                    click++
                }
            }

            // add status of rating stars
            switch (idx + 1) {
                case 1:
                    ratingText.textContent = 'Tệ'
                    break
                case 2:
                    ratingText.textContent = 'Không hài lòng'
                    break
                case 3:
                    ratingText.textContent = 'Bình thường'
                    break
                case 4:
                    ratingText.textContent = 'Hài lòng'
                    break
                case 5:
                    ratingText.textContent = 'Tuyệt vời'
                    break
                default:
                    ratingText.textContent = ''
            }
        })
    })
})


// Fetch rating
const ratingForm = document.querySelector('.rating-form')
ratingForm.addEventListener('submit', submitRating)
function submitRating(event) {
    event.preventDefault()

    const feedbacks = []
    const products = Array.from(ratingForm.querySelectorAll('.feedback-form-item'))

    products.forEach(product => {
        let productVariantId = product.querySelector('input[name="product_variant_id"]').value
        let feedbackRate = product.querySelector('input[name="rating"]').value ?? 5
        let feedbackContent = product.querySelector('textarea').value

        feedbacks.push({
            product_variant_id: productVariantId,
            feedback_rate: feedbackRate,
            feedback_content: feedbackContent,
        })
    })

    const orderId = ratingForm.querySelector('input[name="order_id"]').value

    fetch('/account/feedback', {
        body: JSON.stringify({ order_id: orderId, feedbacks: feedbacks }),
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    })
        .then(() => {
            const successModal = document.querySelector('.success-modal')
            successModal.style.display = 'flex'
            setTimeout(() => {
                successModal.style.display = 'none'
            }, 1000)

            window.location.href = '/account/purchase?order_status=Hoàn%20thành'
        })
}
