const general = function () {}

// Hàm xử lý datetỉme ---> Thứ x, ngày x tháng x năm x
general.toXDDMMYYYY = function (datetime) {
    let day = ''
    switch (datetime.getDay()) {
        case 0:
            day = 'Chủ nhật'
            break

        case 1:
            day = 'Thứ hai'
            break

        case 2:
            day = 'Thứ ba'
            break

        case 3:
            day = 'Thứ tư'
            break

        case 4:
            day = 'Thứ năm'
            break

        case 5:
            day = 'Thứ sáu'
            break

        case 6:
            day = 'Thứ bảy'
            break

    }

    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }

    let year = datetime.getYear() + 1900
    return (day + ', ngày ' + datetime.getDate() + ' tháng ' + datetime.getMonth() + ' năm ' + year)
}

// Hàm xử lý datetime ---> DD tháng MM năm YYYY
general.toDDthangMMnamYYYY = function (datetime) {
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }
    let year = datetime.getYear() + 1900
    return (datetime.getDate() + ' tháng ' + datetime.getMonth() + ' năm ' + year)
}

// Hàm xử lý datetime ---> DD/MM/YYYY
general.toDDMMYYYY = function (datetime) {
    console.log(datetime)
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate()
    }
    console.log(datetime.getMonth())
    let month = datetime.getMonth()
    if (month < 10) {
        month = "0" + datetime.getMonth()
    }
    let year = datetime.getYear() + 1900
    return (date + '/' + month + '/' + year)
}

// Hàm xử lý datetime ---> DD tháng MM HH:MM
general.toDDMMYYYYHHMM = function (datetime) {
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }
    let year = datetime.getYear() + 1900
    return (date + ' tháng ' + datetime.getMonth() + ' năm ' + year + ' ' + general.toHHMM(datetime))
}

// Hàm xử lý datetime ---> giờ:phút
general.toHHMM = function (datetime) {
    let hour = datetime.getHours()
    if (hour < 10) {
        hour = "0" + datetime.getHours();
    }

    let minute = datetime.getMinutes()
    if (minute < 10) {
        minute = "0" + datetime.getMinutes();
    }

    return (hour + ':' + minute)
}

general.toCurrency = function (money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c;
    });
    return currency;
}

general.bookStatus = function (book_status) {
    let book_status_mean = ''
    switch (book_status) {
        case -1:
            book_status_mean = 'Đã hủy'
            break

        case 0:
            book_status_mean = 'Chưa sử dụng'
            break

        case 1:
            book_status_mean = 'Đã sử dụng'
            break

        default:
            book_status_mean = 'Đang xử lý'
            break
    }
    return book_status_mean
}

general.bookIsPaid = function (book_is_paid) {
    let book_is_paid_mean = ''
    switch (book_is_paid) {
        case 0:
            book_is_paid_mean = 'Chưa thanh toán'
            break

        case 1:
            book_is_paid_mean = 'Đã thanh toán'
            break

        default:
            book_is_paid_mean = 'Đang xử lý'
            break
    }
    return book_is_paid_mean
}


module.exports = general;