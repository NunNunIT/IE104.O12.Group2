// Thêm "active" vào sidebar-list-item dựa vào chỉ số trang
const sidebarListItems = document.querySelectorAll('.sidebar-list-item');
sidebarListItems[0].classList.add('active');

// ---------- CHARTS ----------

// BAR CHART
const barChartOptions = {
  series: [
    {
      data: [10, 8, 6, 4, 2],
      name: 'Số lượng bán',
    },
  ],
  chart: {
    type: 'bar',
    background: 'transparent',
    height: 350,
    toolbar: {
      show: false,
    },
  },
  // colors: ['#2962ff', '#d50000', '#2e7d32', '#ff6d00', '#583cb3'],
  plotOptions: {
    bar: {
      distributed: true,
      borderRadius: 4,
      horizontal: false,
      columnWidth: '40%',
    },
  },
  dataLabels: {
    enabled: false,
  },
  fill: {
    opacity: 1,
  },
  grid: {
    borderColor: 'black',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },
    },
  },
  legend: {
    labels: {
      colors: 'black',
    },
    show: true,
    position: 'top',
  },
  stroke: {
    colors: ['transparent'],
    show: true,
    width: 2,
  },
  tooltip: {
    shared: true,
    intersect: false,
    theme: 'dark',
  },
  xaxis: {
    categories: ['Laptop', 'Phone', 'Monitor', 'Headphones', 'Camera'],
    title: {
      style: {
        color: '#f5f7ff',
      },
    },
    axisBorder: {
      show: true,
      color: '#55596e',
    },
    axisTicks: {
      show: true,
      color: '#55596e',
    },
    labels: {
      style: {
        colors: 'black',
      },
    },
  },
  yaxis: {
    title: {
      style: {
        color: '#f5f7ff',
      },
    },
    axisBorder: {
      color: '#55596e',
      show: true,
    },
    axisTicks: {
      color: '#55596e',
      show: true,
    },
    labels: {
      style: {
        colors: 'black',
      },
    },
  },
};

const barChart = new ApexCharts(
  document.querySelector('#bar-chart'),
  barChartOptions
);
barChart.render();

// AREA CHART
const areaChartOptions = {
  series: [
    {
      name: 'Đơn hàng',
      data: [11, 45, 32, 32, 34, 52, 41, 20, 34, 52, 41, 20],
    },
    {
      name: 'Doanh thu',
      data: [310000000, 420000000, 400000000, 510000000, 420000000, 1090000000, 1000000000, 900000000, 420000000, 400000000, 510000000, 420000000],
    },
  ],
  chart: {
    type: 'area',
    background: 'transparent',
    height: 350,
    stacked: false,
    toolbar: {
      show: false,
    },
  },
  colors: ['#d50000', '#00ab57'],
  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
  dataLabels: {
    enabled: false,
  },
  fill: {
    gradient: {
      opacityFrom: 0.4,
      opacityTo: 0.1,
      shadeIntensity: 1,
      stops: [0, 100],
      type: 'vertical',
    },
    type: 'gradient',
  },
  grid: {
    borderColor: 'black',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },labels: {
        color: 'black',
      }
    },
  },
  legend: {
    labels: {
      colors: 'black',
    },
    show: true,
    position: 'top',
  },
  markers: {
    size: 6,
    strokeColors: 'black',
    strokeWidth: 3,
  },
  stroke: {
    curve: 'smooth',
  },
  xaxis: {
    axisBorder: {
      color: 'black',
      show: true,
    },
    axisTicks: {
      color: 'black',
      show: true,
    },
    labels: {
      offsetY: 5,
      style: {
        colors: 'black',
      },
    },
  },
  yaxis: [
    {
      title: {
        // text: 'Đơn hàng',
        style: {
          color: 'black',
        },
      },
      labels: {
        style: {
          colors: ['black'],
        },
      },
    },
    {
      opposite: true,
      title: {
        // text: 'Doanh thu',
        style: {
          color: 'black',
        },
      },
      labels: {
        style: {
          colors: ['black'],
        },
      },
    },
  ],
  tooltip: {
    shared: true,
    intersect: false,
    theme: 'dark',
  },
};

const areaChart = new ApexCharts(
  document.querySelector('#area-chart'),
  areaChartOptions
);
areaChart.render();
