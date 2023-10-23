const initSlider = () => {
    const imageList = document.querySelector(".slider-wrapper .slider-wrapper__image-list");
    const slideButtons = document.querySelectorAll(".slider-wrapper .slider-wrapper__slide-button");
    const sliderScrollbar = document.querySelector(".container .container__slider-scrollbar");
    const scrollbarThumb = sliderScrollbar.querySelector(".container__slider-scrollbar__scrollbar-thumb");
    const maxScrollLeft = imageList.scrollWidth - imageList.clientWidth;
    const slideWidth = imageList.clientWidth;

    // Function for auto slide
    const autoSlide = () => {
        if (imageList.scrollLeft + slideWidth < maxScrollLeft) {
            imageList.scrollBy({
                left: slideWidth,
                behavior: "smooth"
            });
        } else {
            imageList.scrollTo({
                left: 0,
                behavior: "smooth"
            });
        }
    };

    // Sử dụng hàm `setInterval` để tự động chuyển slide sau mỗi 2 giây
    let autoSlideInterval = setInterval(autoSlide, 2000);

    // Khi trình chiếu được di chuyển bằng tay, thi se xóa bất kỳ interval tự động nào đang chạy
    imageList.addEventListener("scroll", () => {
        clearInterval(autoSlideInterval);
        autoSlideInterval = setInterval(autoSlide, 2000);
    });

    // Handle scrollbar thumb drag
    scrollbarThumb.addEventListener("mousedown", (e) => {
        const startX = e.clientX;
        const thumbPosition = scrollbarThumb.offsetLeft;
        const maxThumbPosition = sliderScrollbar.getBoundingClientRect().width - scrollbarThumb.offsetWidth;

        // Update thumb position on mouse move
        const handleMouseMove = (e) => {
            const deltaX = e.clientX - startX;
            const newThumbPosition = thumbPosition + deltaX;

            // Ensure the scrollbar thumb stays within bounds
            const boundedPosition = Math.max(0, Math.min(maxThumbPosition, newThumbPosition));
            const scrollPosition = (boundedPosition / maxThumbPosition) * maxScrollLeft;

            scrollbarThumb.style.left = `${boundedPosition}px`;
            imageList.scrollLeft = scrollPosition;
        };

        // Remove event listeners on mouse up
        const handleMouseUp = () => {
            document.removeEventListener("mousemove", handleMouseMove);
            document.removeEventListener("mouseup", handleMouseUp);
        };

        // Add event listeners for drag interaction
        document.addEventListener("mousemove", handleMouseMove);
        document.addEventListener("mouseup", handleMouseUp);
    });

    // Slide images according to the slide button clicks
    slideButtons.forEach((button) => {
        button.addEventListener("click", () => {
            const direction = button.id === "prev-slide" ? -1 : 1;
            const scrollAmount = slideWidth * direction;
            imageList.scrollBy({
                left: scrollAmount,
                behavior: "smooth"
            });
        });
    });

    // Show or hide slide buttons based on scroll position
    const handleSlideButtons = () => {
        slideButtons[0].style.display = imageList.scrollLeft <= 0 ? "none" : "flex";
        slideButtons[1].style.display = imageList.scrollLeft >= maxScrollLeft ? "none" : "flex";
    };

    // Update scrollbar thumb position based on image scroll
    const updateScrollThumbPosition = () => {
        const scrollPosition = imageList.scrollLeft;
        const thumbPosition = (scrollPosition / maxScrollLeft) * (sliderScrollbar.clientWidth - scrollbarThumb.offsetWidth);
        scrollbarThumb.style.left = `${thumbPosition}px`;
    };

    // Call these functions when image list scrolls
    imageList.addEventListener("scroll", () => {
        updateScrollThumbPosition();
        handleSlideButtons();
    });
};

window.addEventListener("resize", initSlider);
window.addEventListener("load", initSlider);