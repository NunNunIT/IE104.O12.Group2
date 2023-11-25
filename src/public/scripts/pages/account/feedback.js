
const allStar = document.querySelectorAll('.rating .star');
const ratingValue = document.querySelector('.rating input');
const ratingText = document.getElementById('ratingText');

allStar.forEach((item, idx) => {
    item.addEventListener('click', function () {
        let click = 0;
        ratingValue.value = idx + 1;

        allStar.forEach(i => {
            i.classList.replace('bxs-star', 'bx-star');
            i.classList.remove('active');
        });

        for (let i = 0; i < allStar.length; i++) {
            if (i <= idx) {
                allStar[i].classList.replace('bx-star', 'bxs-star');
                allStar[i].classList.add('active');
            } else {
                allStar[i].style.setProperty('--i', click);
                click++;
            }
        }

        // add status of rating stars
        switch (idx + 1) {
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

        // add color for rating text
        ratingText.style.color = '#e5ad06';
    });
});
