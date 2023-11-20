const filterItems = document.querySelectorAll('.seacrh-result__filter-normal__content');

let selectedFilterItem = null;

filterItems.forEach(item => {
    item.addEventListener('click', () => {
        // Ẩn dropdown-content của thành phần trước đó (nếu có)
        if (selectedFilterItem) {
            const prevDropdownContent = selectedFilterItem.querySelector('.dropdown-content');
            prevDropdownContent.style.display = 'none';
        }

        // Đặt lại màu viền cho tất cả các thành phần
        filterItems.forEach(originalItem => {
            originalItem.style.borderColor = '';
            originalItem.style.color = '';
        });

        // Thiết lập màu viền xanh cho thành phần hiện tại
        item.style.borderColor = 'var(--primary-color-1)';
        item.style.color = 'var(--primary-color-1)';

        // Hiển thị dropdown-content liên quan
        const dropdownContent = item.querySelector('.dropdown-content');
        dropdownContent.style.display = 'flex';

        // Lưu trạng thái của thành phần hiện tại
        selectedFilterItem = item;
    });
});

// Sự kiện click ngoài để đặt lại màu viền của tất cả các thành phần và ẩn dropdown-content
document.body.addEventListener('click', function (event) {
    const target = event.target;

    // Kiểm tra xem có phải là thành phần seacrh-result__filter-normal__content không
    const isFilterItem = target.closest('.seacrh-result__filter-normal__content');

    if (!isFilterItem) {
        filterItems.forEach(originalItem => {
            originalItem.style.borderColor = '';
            originalItem.style.color = '';
            const dropdownContent = originalItem.querySelector('.dropdown-content');
            dropdownContent.style.display = 'none';
        });

        // Reset trạng thái của thành phần đang chọn
        selectedFilterItem = null;
    }
});

const brandItems = document.querySelectorAll('.seacrh-result__filter-brand__img');

brandItems.forEach(item => {
    // Sử dụng biến để theo dõi trạng thái của mỗi thành phần
    let isItemSelected = false;

    item.addEventListener('click', () => {
        // Nếu đã chọn, hủy chọn và đặt lại màu viền
        if (isItemSelected) {
            item.style.borderColor = '';
            isItemSelected = false;
        } else {
            // Nếu chưa chọn, đặt màu viền xanh và đánh dấu là đã chọn
            item.style.borderColor = 'var(--primary-color-1)';
            isItemSelected = true;
        }
    });
});


const sortItem = document.querySelector('.seacrh-result__sort');
let sortedFilterItem = null;

sortItem.addEventListener('click', () => {
    // Ẩn dropdown-content của thành phần trước đó (nếu có)
    if (sortedFilterItem) {
        const prevDropdownContent = sortedFilterItem.querySelector('.dropdown-content--sort');
        prevDropdownContent.style.display = 'none';
    }

    // Đặt lại màu viền cho tất cả các thành phần
    filterItems.forEach(originalItem => {
        originalItem.style.borderColor = '';
        originalItem.style.color = '';
    });

    // Thiết lập màu viền xanh cho thành phần hiện tại
    sortItem.style.borderColor = 'var(--primary-color-1)';
    sortItem.style.color = 'var(--primary-color-1)';

    // Hiển thị dropdown-content liên quan
    const dropdownContent = sortItem.querySelector('.dropdown-content--sort');
    dropdownContent.style.display = 'flex';

    // Lưu trạng thái của thành phần hiện tại
    sortedFilterItem = sortItem;
});

// Sự kiện click ngoài để đặt lại màu viền của tất cả các thành phần và ẩn dropdown-content
document.body.addEventListener('click', function (event) {
    const target = event.target;
    const isSortItem = target.closest('.seacrh-result__sort');
    if (!isSortItem) {
        sortItem.style.borderColor = '';
        sortItem.style.color = '';
        const dropdownContent = sortItem.querySelector('.dropdown-content--sort');
        dropdownContent.style.display = 'none';
        sortedFilterItem = null;
    }
});



