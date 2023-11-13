let span = document.querySelector(".scrollup");
window.onscroll = function () {
    this.scrollY >= 1000 ? span.classList.add("show") : span.classList.remove("show");
};

span.onclick = function () {
    window.scroll({
        top: 0,
        behavior: "smooth"
    })
}