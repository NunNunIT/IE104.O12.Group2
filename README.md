# [IE104.O12.Group2] - ĐỒ ÁN XÂY DỰNG WEBSITE CỬA HÀNG ĐIỆN MÁY TECHTWO.

* Trường Đại học Công nghệ Thông tin, Đại học Quốc gia Thành phố Hồ Chí Minh (ĐHQG-HCM)
* Khoa: Khoa học và kỹ thuật thông tin (KTTT)
* GVHD: ThS. Võ Tấn Khoa
* Nhóm sinh viên thực hiện: Nhóm 2

## FORM đóng góp ý kiến: [Form đóng góp ý kiến](https://forms.gle/zCPqAjYzTPvj2MMY8)

## Danh sách thành viên
|STT | Họ tên | MSSV|
|:---:|:-------------:|:-----:|
|1. 	| Nguyễn Thị Hồng Nhung | 21522436
|2. 	| Lê Đức Mạnh		| 21521116 
|3. 	| Lý Phi Lân		|	21520319
|4.  | Phan Nguyễn Hải Yến | 21521698
|5. 	| Vi Thị Hương | 21522132

## Giới thiệu
Trong thời đại hiện đại, sự tiện lợi và linh hoạt trong việc mua sắm trực tuyến ngày càng trở thành một xu hướng phổ biến. Đối với lĩnh vực điện máy, việc tạo ra một website bán hàng chuyên nghiệp không chỉ là một cơ hội kinh doanh mà còn là cách để đáp ứng nhu cầu ngày càng cao của khách hàng.

Vì vậy, nhóm quyết định chọn đề tài "Xây dựng website cửa hàng điện máy TECHTWO.".

## Tính năng
|ID	|Tên tác nhân |	Mô tả tác nhân|
|:---:|:-------------:|:-----:|
|A1	|Unauthenticated User (Người dùng chưa xác thực) |	Người dùng chưa có tài khoản hoặc có tài khoản nhưng chưa đăng nhập. Người dùng này được quyền sử dụng các chức năng công khai của hệ thống.|
|A2	|Authenticated User (Người dùng đã xác thực) |	Người dùng có tài khoản và đã đăng nhập, có một số quyền hạn sử dụng trong hệ thống.|
|A3	|Customer (Khách hàng)|	Đây là người dùng cuối sử dụng các chức năng của hệ thống như đặt hàng, tìm sản phẩm, xem sản phẩm...|
|A4 |Staff | Nhân viên có tài khoản trong hệ thống. Tài khoản của họ được tạo bởi Quản trị viên. Họ sử dụng hệ thống để xác nhận và xử lý các đơn hàng, cập nhật trạng thái,...|
|A5 |Admin | Là người dùng có quyền hạn cao nhất trong hệ thống. Quản trị viên có thể quản lý người dùng, quản lý thông tin sản phẩm, xem và cập nhật đơn hàng, cấu hình hệ thống và xem các báo cáo. Quản trị viên đảm bảo hoạt động chung của hệ thống, bảo mật, và có quyền cấp phép và phân quyền cho các tài khoản khác trong hệ thống.|



|Mã chức năng	|	Tên chức năng	|	Tác nhân	|
|:---:|:-------------:|:-----:|
||	UC1. Unauthenticated User Module	(Mô-đun Người dùng chưa xác thực)					||
|	UC1.01	|	Đăng ký tài khoản khách hàng	|	Unauthenticated User 	|
|	UC1.02	|	Đăng nhập tài khoản 	|	Unauthenticated User	|
|	UC1.03	|	Quên mật khẩu	|	Unauthenticated User 	|
|	UC1.04	|	Tìm kiếm sản phẩm	|	Unauthenticated User 	|
|	UC1.05	|	Xem danh sách sản phẩm	|	Unauthenticated User 	|
|	UC1.06	|	Xem chi tiết sản phẩm	|	Unauthenticated User 	|
|	UC1.07	|	Sử dụng bộ lọc	|	Unauthenticated User	|
||	UC2. Authenticated User Module	 (Mô-đun Người dùng đã xác thực)					||
|	UC2.01	|	Xem thông tin cá nhân	|	Authentication User	|
|	UC2.02	|	Sửa thông tin cá nhân	|	Authentication User	|
|	UC2.03	|	Xem thông báo	|	Authentication User	|
|	UC2.04	|	Đổi mật khẩu	|	Authentication User	|
|	UC2.05	|	Đăng xuất	|	Authentication User	|
||	UC3. Customer Module (Mô-đun Khách hàng)					||
|	UC3.01	|	Thêm vào giỏ hàng	|	Customer	|
|	UC3.02	|	Quản lý giỏ hàng	|	Customer	|
|	UC3.03	|	Đặt hàng	|	Customer	|
|	UC3.04	|	Thanh toán	|	Customer	|
|	UC3.05	|	Xem lịch sử đơn mua	|	Customer	|
|	UC3.06	|	Hủy đơn	|	Customer	|
|	UC3.07	|	Đánh giá	|	Customer	|
|	UC3.08	|	Yêu cầu bảo hành	|	Customer	|
||	UC4. Staff Module (Mô-đun Nhân viên)||
|	UC4.01	|	Quản lý đơn hàng	|	Staff, Admin	|
|	UC4.02	|	Quản lý bình luận	|	Staff, Admin	|
||	UC5. Admin Module (Mô-đun Quản trị viên)||
|	UC5.01	|	Quản lý sản phẩm	|	Admin	|
|	UC5.02	|	Quản lý nhân viên	|	Admin	|
|	UC5.03	|	Quản lý khuyến mãi	|	Admin	|
|	UC5.04	|	Thống kê	|	Admin	|


## Công nghệ sử dụng
* [Node.js] - Xử lý API, Back-end
* [Express] - Framework nằm trên chức năng máy chủ web của NodeJS
* [EJS] - Hỗ trợ phát triển các trang web bằng cách cho phép tạo ra các mẫu HTML được kết hợp với mã JavaScript
* [Xampp] - Cung cấp các môi trường phát triển cục bộ cho các ứng dụng web
* [MySQL] - Hệ quản trị cơ sở dữ liệu quan hệ sử dụng để lưu trữ dữ liệu cho trang web
* [HTML-CSS-JS] - Bộ ba công nghệ web, hiện thức hóa giao diện

## Cài đặt
Yêu cầu : 
* [Node.js](https://nodejs.org/) v19+ để có thể chạy chương trình.
* [Xampp](https://www.apachefriends.org/download.html) để thực hiện thao tác liên quan đến CSDL.

#### Bước 1: Mở Xampp, truy cập vào phpMyAdmin
* Bật Apache và MySQL
* Sau khi MySQL chạy, hãy nhấn chọn Admin của MySQL
![image](https://github.com/namtuthien/SE104.O11.Group6/assets/145759907/1b60556b-657c-482c-8928-163192962c65)

#### Bước 2: Tạo cơ sở dữ liệu mới trong phpMyAdmin
Tạo database mới có tên là
```
ie104_group2
```
![image](https://github.com/NunNunIT/IE104.O12.Group2/assets/145759907/4dcd1d54-f022-4c7f-b6d1-a5544b29c34e)

Bạn có thể tạo database theo cách trong hình hoặc mở tab SQL tại thanh điều hướng và sử dụng lệnh 
```
CREATE DATABASE ie104_group2;
```

#### Bước 3: Nhập dữ liệu cho cơ sở dữ liệu:
- Đầu tiên, truy cập thư mục src/config/database. Tại đây chứa file sql cần thiết
![image](https://github.com/NunNunIT/IE104.O12.Group2/assets/145759907/b5841b38-d7db-4927-bcaf-e87fc78eaffe)
- Tải file: ie104_group2.sql
- Chọn tab Import trên thanh điều hướng
- Chọn Choose File --> Chọn file mới tải về ở trên
![image](https://github.com/NunNunIT/IE104.O12.Group2/assets/145759907/eadc23ee-fe49-418d-a57e-09d4ee48c48f)
    + Sau đó, vuốt xuống dưới để nhấn nút 'Import'

Sau khi thực hiện cách trên bạn sẽ có đầy đủ cơ sở dữ liệu của trang web. Kết quả như trong hình:
![image](https://github.com/NunNunIT/IE104.O12.Group2/assets/145759907/0afa3cdd-46ec-4eda-abdc-bac2ca1729fd)

#### Bước 4: Thực hiện clone repository này với lệnh
```
https://github.com/NunNunIT/IE104.O12.Group2.git
```
#### Bước 5: Mở dự án mới clone về và thực hiện các câu lệnh sau
```
npm install
```
```
npm start
```
Nếu ở màn hình terminal cho ra kết quả sau đây, tức các bạn đã thành công
![image](https://github.com/namtuthien/SE104.O11.Group6/assets/145759907/3b6feed5-2199-479d-8b54-9531ce608204)

#### Bước 6: Mở website. Có 2 cách:
* Cách 1: Ctrl + Click vào đường link http://127.0.0.1:3000 trên terminal
* Cách 2: Mở trình duyệt bất kỳ và nhập đường dẫn sau ``` http://127.0.0.1:3000 ```

#### Đến đây các bạn đã có thể vào trang web của nhóm. 
* Bạn có thể đăng ký tài khoản khách hàng mới để thực hiện các thao tác trong trang web hoặc đăng nhập bằng tài khoản sau:
  + Email: ```0987654321```
  + Mật khẩu: ```khachhang1```
* Bạn có thể đăng nhập tài khoản admin thông qua đường dẫn ``` http://127.0.0.1:3000/admin/login ```
  + Tên đăng nhập: ```21522436```
  + Mật khẩu: ```adminnhung```

![image](https://github.com/NunNunIT/IE104.O12.Group2/assets/145759907/2ba17bf7-ef6e-4b20-9e44-9d31403bf34f)

## Chúc các bạn thành công!!!
