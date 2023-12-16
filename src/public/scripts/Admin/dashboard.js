// Thêm "active" vào admin-sidebar__list-item dựa vào chỉ số trang
const sidebarListItems = document.querySelectorAll('.admin-sidebar__list-item');
sidebarListItems[0].classList.add('active');

var data = {
	"prices": [7114.25, 7126.6, 7116.95, 7203.7, 7233.75, 7451.0, 7381.15, 7348.95, 7347.75, 7311.25, 7266.4, 7253.25, 7215.45, 7266.35, 7315.25, 7237.2, 7191.4, 7238.95, 7222.6, 7217.9, 7359.3, 7371.55, 7371.15, 7469.2, 7429.25, 7434.65, 7451.1, 7475.25, 7566.25, 7556.8, 7525.55, 7555.45, 7560.9, 7490.7, 7527.6, 7551.9, 7514.85, 7577.95, 7592.3, 7621.95, 7707.95, 7859.1, 7815.7, 7739.0, 7778.7, 7839.45, 7756.45, 7669.2, 7580.45, 7452.85, 7617.25, 7701.6, 7606.8, 7620.05, 7513.85, 7498.45, 7575.45, 7601.95, 7589.1, 7525.85, 7569.5, 7702.5, 7812.7, 7803.75, 7816.3, 7851.15, 7912.2, 7972.8, 8145.0, 8161.1, 8121.05, 8071.25, 8088.2, 8154.45, 8148.3, 8122.05, 8132.65, 8074.55, 7952.8, 7885.55, 7733.9, 7897.15, 7973.15, 7888.5, 7842.8, 7838.4, 7909.85, 7892.75, 7897.75, 7820.05, 7904.4, 7872.2, 7847.5, 7849.55, 7789.6, 7736.35, 7819.4, 7875.35, 7871.8, 8076.5, 8114.8, 8193.55, 8217.1, 8235.05, 8215.3, 8216.4, 8301.55, 8235.25, 8229.75, 8201.95, 8164.95, 8107.85, 8128.0, 8122.9, 8165.5, 8340.7, 8423.7, 8423.5, 8514.3, 8481.85, 8487.7, 8506.9, 8626.2],
	"dates": ["02 Jun 2017", "05 Jun 2017", "06 Jun 2017", "07 Jun 2017", "08 Jun 2017", "09 Jun 2017", "12 Jun 2017", "13 Jun 2017", "14 Jun 2017", "15 Jun 2017", "16 Jun 2017", "19 Jun 2017", "20 Jun 2017", "21 Jun 2017", "22 Jun 2017", "23 Jun 2017", "27 Jun 2017", "28 Jun 2017", "29 Jun 2017", "30 Jun 2017", "03 Jul 2017", "04 Jul 2017", "05 Jul 2017", "06 Jul 2017", "07 Jul 2017", "10 Jul 2017", "11 Jul 2017", "12 Jul 2017", "13 Jul 2017", "14 Jul 2017", "17 Jul 2017", "18 Jul 2017", "19 Jul 2017", "20 Jul 2017", "21 Jul 2017", "24 Jul 2017", "25 Jul 2017", "26 Jul 2017", "27 Jul 2017", "28 Jul 2017", "31 Jul 2017", "01 Aug 2017", "02 Aug 2017", "03 Aug 2017", "04 Aug 2017", "07 Aug 2017", "08 Aug 2017", "09 Aug 2017", "10 Aug 2017", "11 Aug 2017", "14 Aug 2017", "16 Aug 2017", "17 Aug 2017", "18 Aug 2017", "21 Aug 2017", "22 Aug 2017", "23 Aug 2017", "24 Aug 2017", "28 Aug 2017", "29 Aug 2017", "30 Aug 2017", "31 Aug 2017", "01 Sep 2017", "04 Sep 2017", "05 Sep 2017", "06 Sep 2017", "07 Sep 2017", "08 Sep 2017", "11 Sep 2017", "12 Sep 2017", "13 Sep 2017", "14 Sep 2017", "15 Sep 2017", "18 Sep 2017", "19 Sep 2017", "20 Sep 2017", "21 Sep 2017", "22 Sep 2017", "25 Sep 2017", "26 Sep 2017", "27 Sep 2017", "28 Sep 2017", "29 Sep 2017", "03 Oct 2017", "04 Oct 2017", "05 Oct 2017", "06 Oct 2017", "09 Oct 2017", "10 Oct 2017", "11 Oct 2017", "12 Oct 2017", "13 Oct 2017", "16 Oct 2017", "17 Oct 2017", "18 Oct 2017", "19 Oct 2017", "23 Oct 2017", "24 Oct 2017", "25 Oct 2017", "26 Oct 2017", "27 Oct 2017", "30 Oct 2017", "31 Oct 2017", "01 Nov 2017", "02 Nov 2017", "03 Nov 2017", "06 Nov 2017", "07 Nov 2017", "08 Nov 2017", "09 Nov 2017", "10 Nov 2017", "13 Nov 2017", "14 Nov 2017", "15 Nov 2017", "16 Nov 2017", "17 Nov 2017", "20 Nov 2017", "21 Nov 2017", "22 Nov 2017", "23 Nov 2017", "24 Nov 2017", "27 Nov 2017", "28 Nov 2017"]
}

var monthDataSeries1 = {
	"prices": [8107.85, 8128.0, 8122.9, 8165.5, 8340.7, 8423.7, 8423.5, 8514.3, 8481.85, 8487.7, 8506.9, 8626.2, 8668.95, 8602.3, 8607.55, 8512.9, 8496.25, 8600.65, 8881.1, 9340.85],
	"dates": ["13 Nov 2017", "14 Nov 2017", "15 Nov 2017", "16 Nov 2017", "17 Nov 2017", "20 Nov 2017", "21 Nov 2017", "22 Nov 2017", "23 Nov 2017", "24 Nov 2017", "27 Nov 2017", "28 Nov 2017", "29 Nov 2017", "30 Nov 2017", "01 Dec 2017", "04 Dec 2017", "05 Dec 2017", "06 Dec 2017", "07 Dec 2017", "08 Dec 2017"]
}

var monthDataSeries2 = {
	"prices": [8423.7, 8423.5, 8514.3, 8481.85, 8487.7, 8506.9, 8626.2, 8668.95, 8602.3, 8607.55, 8512.9, 8496.25, 8600.65, 8881.1, 9040.85, 8340.7, 8165.5, 8122.9, 8107.85, 8128.0]
}

Apex.grid = {
	padding: {
		right: 0,
		left: 0
	}
}

Apex.dataLabels = {
	enabled: false
}

var randomizeArray = function (arg) {
	var array = arg.slice();
	var currentIndex = array.length,
		temporaryValue, randomIndex;

	while (0 !== currentIndex) {

		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex -= 1;

		temporaryValue = array[currentIndex];
		array[currentIndex] = array[randomIndex];
		array[randomIndex] = temporaryValue;
	}

	return array;
}

var colorPalette = ['#00D8B6', '#008FFB', '#FEB019', '#FF4560', '#775DD0']

var optionsArea = {
	series: [{
		name: 'series1',
		data: [31, 40, 28, 51, 42, 109, 100]
	}, {
		name: 'series2',
		data: [11, 32, 45, 32, 34, 52, 41]
	}],
	chart: {
		height: 350,
		type: 'area'
	},
	dataLabels: {
		enabled: false
	},
	stroke: {
		curve: 'smooth'
	},
	xaxis: {
		type: 'datetime',
		categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
	},
	tooltip: {
		x: {
			format: 'dd/MM/yy HH:mm'
		},
	},
}

var chartArea = new ApexCharts(document.querySelector('#area'), optionsArea);
chartArea.render();

var optionsBar = {
	series: [{
		name: 'Đã thanh toán',
		data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
	}, {
		name: 'Đã hủy',
		data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
	}],
	chart: {
		type: 'bar',
		height: 350
	},
	plotOptions: {
		bar: {
			horizontal: false,
			columnWidth: '55%',
			endingShape: 'rounded'
		},
	},
	dataLabels: {
		enabled: false
	},
	stroke: {
		show: true,
		width: 2,
		colors: ['transparent']
	},
	xaxis: {
		categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
	},
	fill: {
		opacity: 1
	},
}

var chartBar = new ApexCharts(document.querySelector('#bar'), optionsBar);
chartBar.render();


var optionDonut = {
	chart: {
		type: 'donut',
		width: '100%',
		height: 400
	},
	dataLabels: {
		enabled: false,
	},
	plotOptions: {
		pie: {
			customScale: 0.8,
			donut: {
				size: '75%',
			},
			offsetY: 20,
		},
		stroke: {
			colors: undefined
		}
	},
	colors: colorPalette,
	title: {
		// text: 'Department Sales',
		style: {
			fontSize: '18px'
		}
	},
	series: [21, 23, 19, 14, 6],
	labels: ['Điện máy', 'Điện tử', 'Nhà bếp', 'Gia dụng', 'Khác'],
	legend: {
		position: 'left',
		offsetY: 80
	}
}

var donut = new ApexCharts(
	document.querySelector("#donut"),
	optionDonut
)
donut.render();


function trigoSeries(cnt, strength) {
	var data = [];
	for (var i = 0; i < cnt; i++) {
		data.push((Math.sin(i / strength) * (i / strength) + i / strength + 1) * (strength * 2));
	}

	return data;
}

var optionsLine = {
	chart: {
		height: 340,
		type: 'line',
		zoom: {
			enabled: false
		}
	},
	plotOptions: {
		stroke: {
			width: 4,
			curve: 'smooth'
		},
	},
	colors: colorPalette,
	series: [{
		name: "Day Time",
		data: trigoSeries(52, 20)
	},
	{
		name: "Night Time",
		data: trigoSeries(52, 27)
	},
	],
	title: {
		floating: false,
		// text: 'Customers',
		align: 'left',
		style: {
			fontSize: '18px'
		}
	},
	subtitle: {
		text: '168,215',
		align: 'center',
		margin: 30,
		offsetY: 40,
		style: {
			color: '#222',
			fontSize: '24px',
		}
	},
	markers: {
		size: 0
	},

	grid: {

	},
	xaxis: {
		labels: {
			show: false
		},
		axisTicks: {
			show: false
		},
		tooltip: {
			enabled: false
		}
	},
	yaxis: {
		tickAmount: 2,
		labels: {
			show: false
		},
		axisBorder: {
			show: false,
		},
		axisTicks: {
			show: false
		},
		min: 0,
	},
	legend: {
		position: 'top',
		horizontalAlign: 'left',
		offsetY: -20,
		offsetX: -30
	}

}

var chartLine = new ApexCharts(document.querySelector('#line'), optionsLine);

// a small hack to extend height in website sample dashboard
chartLine.render().then(function () {
	var ifr = document.querySelector("#wrapper");
	if (ifr.contentDocument) {
		ifr.style.height = ifr.contentDocument.body.scrollHeight + 20 + 'px';
	}
});

// on smaller screen, change the legends position for donut
var mobileDonut = function () {
	if ($(window).width() < 768) {
		donut.updateOptions({
			plotOptions: {
				pie: {
					offsetY: -15,
				}
			},
			legend: {
				position: 'bottom'
			}
		}, false, false)
	} else {
		donut.updateOptions({
			plotOptions: {
				pie: {
					offsetY: 20,
				}
			},
			legend: {
				position: 'left'
			}
		}, false, false)
	}
}

$(window).resize(function () {
	mobileDonut()
});