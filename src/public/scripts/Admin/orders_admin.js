// const Orders = [{
//     productName: 'JavaScript Tutorial',
//     productNumber: '85743',
//     paymentStatus: 'Due',
//     status: 'Pending'
// }, {
//     productName: 'CSS Full Course',
//     productNumber: '97245',
//     paymentStatus: 'Refunded',
//     status: 'Declined'
// },
// {
//     productName: 'Flex-Box Tutorial',
//     productNumber: '36452',
//     paymentStatus: 'Paid',
//     status: 'Active'
// },
// ];

// const logBtn = document.getElementById('log');
// logBtn.addEventListener('click', fetchData);

// async function fetchData() {
//     const response = await fetch('https://reqbin.com/echo/get/json', {
//         headers: {
//             'Accept': 'application/json'
//         }
//     });
//     const data = await response.json();

//     data.forEach(obj => {
//         Object.entries(obj).forEach(([key, value]) => {
//             console.log(`${key} ${value}`);
//         });
//         console.log('-------------------');
//     });
// }

// cons request = require('request');

async function loadNames() {
    const response = await fetch('/api/names');
    const names = await response.json();
  
    console.log(names); 
    // logs [{ name: 'Joker'}, { name: 'Batman' }]
  }
  
  loadNames();



// Orders.forEach(order => {
//     const tr = document.createElement('tr');
//     const trContent = `
//     <td>${order.productName}</td>
//     <td>${order.productNumber}</td>
//     <td>${order.paymentStatus}</td>
//     <td class="${order.status === 'Declined' ? 
//     'danger' : order.status === 'Pending' ? 
//     'warning': 'primary'}">${order.status}</td>
//     <td class="primary">Details</td>
//     `;

//     tr.innerHTML = trContent;
//     document.querySelector('table tbody').appendChild(tr);
// });