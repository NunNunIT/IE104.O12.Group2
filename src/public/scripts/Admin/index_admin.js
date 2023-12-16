// // SIDEBAR TOGGLE
// let sidebarOpen = false
// const sidebar = document.getElementById('admin-sidebar')

// function openSidebar() {
// 	if (!sidebarOpen) {
// 		sidebar.classList.add('sidebar-responsive')
// 		sidebarOpen = true
// 	}
// }

// function closeSidebar() {
// 	if (sidebarOpen) {
// 		sidebar.classList.remove('sidebar-responsive')
// 		sidebarOpen = false
// 	}
// }


const sidebar = document.getElementById('admin-sidebar');
const openSidebarBtn = document.getElementById('menuButton');
let sidebarOpen = false;

// Hàm mở thanh bên
function openSidebar() {
	sidebar.classList.add('sidebar-responsive');
	sidebarOpen = true;
}

// Hàm đóng thanh bên
function closeSidebar() {
	sidebar.classList.remove('sidebar-responsive');
	sidebarOpen = false;
}


// Sự kiện click cho nút mở thanh bên
openSidebarBtn.addEventListener('click', function (event) {
	// Ngăn chặn sự kiện click từ nút mở thanh bên lan ra window và gọi đến window event listener
	event.stopPropagation();
	openSidebar();

	// Thêm event listener cho window
	window.addEventListener('click', windowClickHandler);
});

// Hàm xử lý sự kiện click của window
function windowClickHandler(event) {
	if (sidebar && sidebarOpen && !sidebar.contains(event.target)) {
		closeSidebar();
		// Loại bỏ event listener sau khi đã sử dụng để tránh thêm nhiều listener không cần thiết
		window.removeEventListener('click', windowClickHandler);
	}
}

const closeSidebarBtn = document.getElementById('close-sidebar');
// Sự kiện click cho nút close
closeSidebarBtn.addEventListener('click', function () {
	closeSidebar();
});








