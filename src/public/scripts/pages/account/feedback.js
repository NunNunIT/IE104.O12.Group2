// allStar.forEach(i => {
//     i.classList.replace('bxs-star', 'bx-star');
//     i.classList.remove('active');
// });

// const allStar = document.querySelectorAll('.rating .star')
// const ratingText = document.querySelector('.ratingText')

// allStar.forEach((item, idx) => {
//     item.addEventListener('click', function (event) {
//         let current = event.currentTarget
//         let ratingInput = current.parentElement.querySelector('input')

//         let click = 0
//         ratingInput.value = idx % 5 + 1

//         allStar.forEach(i => {
//             i.classList.replace('bxs-star', 'bx-star')
//             i.classList.remove('active')
//         })

//         for (let i = 0; i < allStar.length; i++) {
//             if (i <= idx) {
//                 allStar[i].classList.replace('bx-star', 'bxs-star')
//                 allStar[i].classList.add('active')
//             } else {
//                 allStar[i].style.setProperty('--i', click)
//                 click++
//             }
//         }

//         // add status of rating stars
//         switch (idx + 1) {
//             case 1:
//                 ratingText.textContent = 'Tệ'
//                 break
//             case 2:
//                 ratingText.textContent = 'Không hài lòng'
//                 break
//             case 3:
//                 ratingText.textContent = 'Bình thường'
//                 break
//             case 4:
//                 ratingText.textContent = 'Hài lòng'
//                 break
//             case 5:
//                 ratingText.textContent = 'Tuyệt vời'
//                 break
//             default:
//                 ratingText.textContent = ''
//         }

//         // add color for rating text
//             ratingText.style.color = '#e5ad06'
//     })
// })

// // Fetch rating
// const ratingForm = document.querySelector('.rating-form')
// ratingForm.addEventListener('submit', submitRating)
// function submitRating(event) {
//     event.preventDefault()

//     const feedbacks = []
//     const products = Array.from(ratingForm.querySelectorAll('.feedback-product'))

//     products.forEach(product => {
//         let orderId = product.querySelector('input[name="rating"]').value ?? 5
//         console.log(orderId)
//     })

//     // product_variant_id, customer_id, order_id, feedback_rate, feedback_content
//     // console.log(products)
// }

const allStar = document.querySelectorAll('.rating .star');
const ratingText = document.querySelector('.ratingText');

allStar.forEach((item, idx) => {
    item.addEventListener('click', function (event) {
        let current = event.currentTarget
        let ratingInput = current.parentElement.querySelector('input')

        let click = 0
        ratingInput.value = idx % 5 + 1
    item.addEventListener('click', function (event) {
        let current = event.currentTarget;
        let ratingInput = current.parentElement.querySelector('input');

        let click = 0;
        ratingInput.value = idx % 5 + 1;

        // Xóa trạng thái đã chọn của tất cả các sao
        allStar.forEach(i => {
            i.classList.replace('bxs-star', 'bx-star')
            i.classList.remove('active')
        })

        // Thiết lập trạng thái cho sao hiện tại
        for (let i = 0; i < allStar.length; i++) {
            if (i <= idx) {
                allStar[i].classList.replace('bx-star', 'bxs-star')
                allStar[i].classList.add('active')
            } else {
                allStar[i].style.setProperty('--i', click)
                click++
            }
        }

        // Kiểm tra xem ratingText có tồn tại không
        if (ratingText) {
            // add status of rating stars
            switch (idx%5 + 1) {
                case 1:
                    ratingText.textContent = 'Tệ';
                    break;
                case 2:
                    ratingText.textContent = 'Không hài lòng';
                    break;
                case 3:
                    ratingText.textContent = 'Bình thường';
                    break;
                case 4:
                    ratingText.textContent = 'Hài lòng';
                    break;
                case 5:
                    ratingText.textContent = 'Tuyệt vời';
                    break;
                default:
                    ratingText.textContent = '';
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

            // add color for rating text
            ratingText.style.color = '#e5ad06';
        }
    });
});

// Fetch rating
const ratingForm = document.querySelector('.rating-form');
ratingForm.addEventListener('submit', submitRating);

function submitRating(event) {
    event.preventDefault();

    const feedbacks = [];
    const products = Array.from(ratingForm.querySelectorAll('.feedback-product'));

    products.forEach(product => {
        let orderId = product.querySelector('input[name="rating"]').value ?? 5;
        console.log(orderId);
    });

    // product_variant_id, customer_id, order_id, feedback_rate, feedback_content
    // console.log(products)
}
