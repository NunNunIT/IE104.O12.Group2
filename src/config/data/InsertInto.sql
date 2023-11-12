-- use ie104
/* Chèn các danh mục sản phẩm */
INSERT INTO categories (category_id, category_name)
VALUES
    ('CAT000001', 'Máy lạnh'),
    ('CAT000002', 'Máy giặt'),
    ('CAT000003', 'Tivi'),
    ('CAT000004', 'Điện thoại'),
    ('CAT000005', 'Laptop'),
    ('CAT000006', 'Tablet'),
    ('CAT000007', 'Tủ lạnh'),
    ('CAT000008', 'Nồi cơm'),
    ('CAT000009', 'Nồi chiên'),
    ('CAT000010', 'Bếp điện');
    
/*insert products
máy lạnh*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO001000', 'CAT000001', 'Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8', 4.5, 'Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 là dòng máy lạnh 1 chiều (chỉ làm lạnh), sở hữu công nghệ Inverter Quattro, chế độ iEco/Gear tiết kiệm điện năng, máy hoạt động êm ái, bền bỉ. Trang bị chế độ làm lạnh nhanh Boost, bộ lọc bụi 2 lớp HD, công nghệ lọc kép Dual Filtration làm sạch không khí, đảm bảo an toàn sức khỏe cho cả gia đình.', 36, 1000),
    ('PRO002000', 'CAT000001', 'Máy lạnh TCL Inverter 1.5 HP TAC-13CSD/XAB1I', 4.0, 'Máy lạnh TCL Inverter 1.5 HP TAC-13CSD/XAB1I ứng dụng các công nghệ làm lạnh Turbo, giúp bạn nhanh chóng tận hưởng được sự mát mẻ trong những ngày nắng nóng. Công nghệ AI Inverter kết hợp cùng Eco cho hiệu năng sử dụng điện được tối ưu hơn, bộ lọc HD giúp trả lại bầu không khí trong lành, loại bỏ mùi hôi. Dàn lạnh vận hành êm ái đi kèm tính năng I-Feel đem lại giấc ngủ ngon và sâu hơn.', 36, 1200),
    ('PRO003000', 'CAT000001', 'Máy lạnh Funiki 1HP HIC09TMU.ST3', 4.2, 'Máy lạnh Funiki 1HP HIC09TMU.ST3 sở hữu công nghệ Inverter giúp tiết kiệm điện năng, chế độ làm lạnh nhanh Turbo giúp tăng tốc làm lạnh, người dùng sẽ không mất quá nhiều thời gian để đạt được mức nhiệt độ mình mong muốn.', 24, 950),
    ('PRO004000', 'CAT000001', 'Máy lạnh Casper Inverter 1 HP TC-09IS35', 4.8, 'Máy lạnh Casper Inverter 1 HP TC-09IS35 cho khả năng làm mát hiệu quả với chế độ làm lạnh nhanh Turbo, tự động điều chỉnh nhiệt độ với cảm biến nhiệt độ iFeel, sử dụng tiết kiệm điện với công nghệ I-saving, tăng tuổi thọ thiết bị với chức năng tự làm sạch iClean.', 36, 1100),
	('PRO005000', 'CAT000001', 'Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8', 4.3, 'Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 có khả năng làm lạnh nhanh nhờ công nghệ Boost và cho hiệu quả tiết kiệm điện đáng kể nhờ Inverter Quattroi, Eco và Gear. Hơn nữa, máy lạnh còn có thể hút ẩm, thích hợp sử dụng trong những ngày trời ẩm ướt, mưa gió khó chịu.', 36, 850);
/*máy giặt*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO006000', 'CAT000002', 'Máy giặt Sharp 7.5 kg ES-Y75HV-S', 4.5, 'Máy giặt Sharp 7.5 kg ES-Y75HV-S có khối lượng giặt 7.5 kg phù hợp với gia đình có 2 - 3 thành viên, được trang bị 4 chương trình giặt đáp ứng được nhu cầu giặt giũ cơ bản của gia đình.', 12, 1000),
    ('PRO007000', 'CAT000002', 'Máy giặt LG AI DD Inverter 10 kg FV1410S4B', 4.0, 'Máy giặt LG AI DD Inverter 10 kg FV1410S4B được tích hợp sẵn 14 chương trình giặt tiện lợi, công nghệ AI DD chăm sóc thông minh giúp bảo vệ sợi vải, công nghệ giặt tiết kiệm TurboWash giặt sạch nhanh chóng, tiết kiệm thời gian cùng công nghệ Inverter tiết kiệm điện năng, vận hành êm ái.', 12, 1200),
    ('PRO008000', 'CAT000002', 'Máy giặt LG AI DD Inverter 10 kg FV1410S4P', 4.2, 'Nhìn chung, với những tính năng và công nghệ hiện đại như giặt hơi nước, công nghệ Inverter, công nghệ giặt 6 Motion DD kết hợp trí thông minh nhân tạo AI DD thì chiếc máy giặt LG Inverter 10 kg FV1410S4P sẽ là lựa chọn lý tưởng cho gia đình từ 5 - 7 thành viên.', 12, 950),
    ('PRO009000', 'CAT000002', 'Máy giặt Whirlpool FreshCare Inverter 8 kg FWEB8002FW', 4.8, 'Máy giặt Whirlpool FreshCare Inverter 8 kg FWEB8002FW sở hữu động cơ truyền động gián tiếp với công nghệ Inverter giúp máy vận hành êm ái và tiết kiệm điện năng. Công nghệ cảm biến thông minh 6th SENSE tự động điều chỉnh lượng nước giặt dựa trên khối lượng quần áo giúp tiết kiệm điện và nước đến 45%.', 12, 1100),
    ('PRO010000', 'CAT000002', 'Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV', 4.3, 'Samsung Inverter 10kg WW10TP44DSB/SV là chiếc máy giặt phù hợp cho những gia đình từ 5 - 7 người. Thiết bị được trang bị nhiều công nghệ thông minh giúp cho việc giặt giũ trở nên nhanh chóng mà vẫn mang lại hiệu quả tiết kiệm điện nước và chất giặt tẩy. Đây chắc chắn là chiếc máy giặt mà bạn không thể bỏ qua cho nhu cầu sắp tới.', 12, 850);

/*tivi*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO011000', 'CAT000003', 'Google Tivi TCL 4K 58 inch 58P635 ', 4.5, 'Google Tivi TCL 4K 58 inch 58P635 sở hữu thiết kế sang trọng, màn hình siêu mỏng kích thước 58 inch, độ phân giải 4K sắc nét, công nghệ HDR10 tối ưu độ sáng, độ tương phản cho trải nghiệm xem phim tuyệt vời. Tích hợp hệ điều hành Google TV với giao diện trực quan, dễ sử dụng cùng kho ứng dụng giải trí đa dạng, phong phú.', 12, 1000),
    ('PRO012000', 'CAT000003', 'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A', 4.0, 'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A là một chiếc tivi cao cấp của Samsung, được trang bị công nghệ màn hình QLED với khả năng tái tạo màu sắc sống động, chân thực. Tivi có độ phân giải 4K, cho hình ảnh sắc nét, chi tiết. Ngoài ra, tivi còn được tích hợp nhiều công nghệ hình ảnh và âm thanh hiện đại, mang đến trải nghiệm giải trí tuyệt vời cho người dùng.', 24, 1200);


/*điện thoại*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO013000', 'CAT000004', 'iPhone 15', 4.5, 'iPhone 15 là dòng điện thoại thông minh cao cấp của Apple, được ra mắt vào năm 2023. Dòng điện thoại này có 3 phiên bản: iPhone 15, iPhone 15 Pro và iPhone 15 Pro Max.', 12, 1000),
    ('PRO014000', 'CAT000004', 'Điện thoại Xiaomi 13T 5G', 4.0, 'Điện thoại Xiaomi 13T 5G là một chiếc điện thoại thông minh tầm trung của Xiaomi, được ra mắt vào tháng 7 năm 2023. Điện thoại này có thiết kế hiện đại, màn hình OLED sắc nét, hiệu năng mạnh mẽ và camera chất lượng cao.', 24, 1200);

/*laptop*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO015000', 'CAT000005', 'Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN)', 4.5, 'Khoác lên mình một thiết kế hiện đại, sang trọng cùng với khả năng chạy các tác vụ một cách mượt mà nhờ bộ xử lý thế hệ 11. Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN) là một sự lựa chọn hoàn hảo dành cho học sinh, sinh viên và nhân viên văn phòng', 24, 1000),
    ('PRO016000', 'CAT000005', 'Laptop Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003)', 4.0, 'Được xây dựng dựa trên tinh thần tạo ra những trải nghiệm gaming xuất sắc, laptop Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003) luôn không ngừng khẳng định vị thế để trở thành lựa chọn hàng đầu trong phân khúc. Với sự kết hợp của màn hình đẹp, sức mạnh và diện mạo mới, laptop sẵn sàng đối mặt với mọi thách thức từ người dùng là game thủ đến nhà sáng tạo.', 12, 1200);


/*tablet*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO017000', 'CAT000006', 'iPad 9 WiFi 64GB', 4.5, 'iPad 9 WiFi 64GB - sản phẩm thuộc phân khúc máy tính bảng giá rẻ của Apple, sở hữu kiểu dáng đơn giản, cấu hình mạnh mẽ cùng camera rõ nét, có thể thoải mái sử dụng trong thời gian dài và đây sẽ là lựa chọn phù hợp cho mọi đối tượng người dùng.', 30, 1000),
    ('PRO018000', 'CAT000006', 'iPad Air 5 M1 Wifi Cellular 64GB', 4.0, 'iPad Air 5 M1 Wifi Cellular 64GB ra mắt với một cấu hình “khủng long” mang đến khả năng chiến tốt mọi tác vụ, bên cạnh đó đây còn là phiên bản được hỗ trợ kết nội mạng di động giúp bạn có thể kết nối internet kể cả khi di chuyển ra bên ngoài vùng phủ sóng wifi.', 12, 1200),
    ('PRO027000', 'CAT000006', 'Máy tính bảng Samsung Galaxy Tab A7 Lite', 4.0, 'Với mức giá hợp lý, Galaxy Tab A7 Lite là mẫu máy tính bảng được Samsung tạo ra nhằm hướng đến đối tượng người dùng đang tìm cho mình một thiết bị giải trí cơ bản với màn hình lớn, hỗ trợ đầy đủ kết nối để có thể truy cập mạng nhanh mọi lúc mọi nơi.', 12, 1200);


/*tủ lạnh*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO019000', 'CAT000007', 'Tủ lạnh Samsung Inverter 488 lít Multi Door RF48A4010M9/SV', 4.5, 'Tủ lạnh Samsung Inverter 488 lít Multi Door RF48A4010M9/SV là một chiếc tủ lạnh 4 cửa với thiết kế sang trọng, hiện đại. Tủ có dung tích sử dụng 488 lít, phù hợp với gia đình từ 4-5 người.', 24, 1000),
    ('PRO020000', 'CAT000007', 'Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK', 4.0, 'Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK là một chiếc tủ lạnh hiện đại với thiết kế 4 cửa ngăn đông phía dưới. Tủ có dung tích 511 lít, phù hợp với gia đình từ 4 - 5 người.', 24, 1200);

/*nồi cơm*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO021000', 'CAT000008', 'Nồi cơm điện tử Philips 1.8 lít HD4515/55', 4.5, 'Nồi cơm điện tử Philips 1.8 lít HD4515/55 sử dụng công nghệ nấu 3D nấu cơm chín đều tơi xốp, lòng nồi bằng hợp kim phủ 6 lớp đá Maifan (lớp tráng Bakuhanseki siêu bền), tích hợp nhiều chế độ cài sẵn tiện lợi,… giúp bạn trổ tài chế biến nhiều món ngon chỉ với 1 thiết bị.', 24, 1000),
    ('PRO022000', 'CAT000008', 'Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520', 4.0, 'Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 trang bị công nghệ 1D nấu cơm chín nhanh, lòng nồi hợp kim nhôm phủ chống dính bền tốt, điều chỉnh bằng nút gạt dễ sử dụng,... là sản phẩm tiện lợi hỗ trợ chế biến những bữa cơm thơm ngon cho gia đình.', 24, 1200);


/*nồi chiên*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO023000', 'CAT000009', 'Lò chiên không dầu Ferroli FAF-12M 12 lít', 4.2, 'Lò chiên không dầu Ferroli FAF-12M 12 lít giúp bạn chiên lượng lớn thực phẩm cùng lúc hoặc nướng gà nguyên con nhờ dung tích 12 lít, có nhiều phụ kiện đi kèm hỗ trợ bạn nấu nướng thuận tiện, bảng điều khiển nút xoay đơn giản, dễ dàng điều chỉnh chức năng.', 12, 850),
    ('PRO024000', 'CAT000009', 'Nồi chiên không dầu Kangaroo KG42AF1 4 lít', 4.6, 'Nồi chiên không dầu Kangaroo với vỏ nhựa dày bền cách nhiệt, dễ lau chùi, dung tích tổng 4 lít và dung tích sử dụng 3.5 lít phục vụ thoải mái cho gia đình 3 – 5 người ăn', 12, 1050);


/*bếp điện*/
INSERT INTO products (product_id, category_id, product_name, product_rate, product_description, product_period, product_view_count)
VALUES
    ('PRO025000', 'CAT000010', 'Bếp từ hồng ngoại lắp âm Pramie 2108', 4.7, 'Bếp từ hồng ngoại Pramie thương hiệu Pramie - Đức, sản xuất tại Malaysia, thiết kế lắp âm hiện đại 1 vùng nấu từ, 1 vùng nấu hồng ngoại sử dụng linh hoạt, tiện lợi cho nhu cầu hàng ngày. Với tổng công suất 4400W, bếp sử dụng điện nối qua aptomat (CB).', 36, 1250),
    ('PRO026000', 'CAT000010', 'Bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB (536.64.101)', 4.2, 'Sản phẩm bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB (536.64.101) chất lượng cao thương hiệu Smeg của Ý, sản xuất tại Ý với thiết kế lắp âm sang trọng, cao cấp chuẩn Châu Âu, mang đến nét đẹp cho không gian bếp hiện đại.', 24, 950);




/*insert discounts*/
INSERT INTO discounts (discount_id, discount_name, discount_description, discount_start_date, discount_end_date, discount_amount, discount_is_display)
VALUES 
('DISC00001', 'Giảm giá Máy lạnh', 'Chương trình giảm giá cho sản phẩm máy lạnh', '2023-11-01', '2023-11-30', 10.0, 1),
('DISC00002', 'Giảm giá Máy giặt', 'Chương trình giảm giá cho sản phẩm máy giặt', '2023-11-01', '2023-11-30', 15.0, 1),
('DISC00003', 'Giảm giá Tivi', 'Chương trình giảm giá cho sản phẩm Tivi', '2023-11-01', '2023-11-30', 20.0, 1),
('DISC00004', 'Giảm giá Điện thoại', 'Chương trình giảm giá cho sản phẩm Điện thoại', '2023-11-01', '2023-11-30', 12.5, 1),
('DISC00005', 'Giảm giá Laptop', 'Chương trình giảm giá cho sản phẩm Laptop', '2023-11-01', '2023-11-30', 10.0, 1),
('DISC00006', 'Giảm giá Tablet', 'Chương trình giảm giá cho sản phẩm Tablet', '2023-11-01', '2023-11-30', 18.0, 1),
('DISC00007', 'Giảm giá Tủ lạnh', 'Chương trình giảm giá cho sản phẩm Tủ lạnh', '2023-11-01', '2023-11-30', 15.0, 1),
('DISC00008', 'Giảm giá Nồi cơm', 'Chương trình giảm giá cho sản phẩm Nồi cơm', '2023-11-01', '2023-11-30', 10.0, 1),
('DISC00009', 'Giảm giá Nồi chiê', 'Chương trình giảm giá cho sản phẩm Nồi chiên', '2023-11-01', '2023-11-30', 12.0, 1),
('DISC00010', 'Giảm giá Bếp điện', 'Chương trình giảm giá cho sản phẩm Bếp điện', '2023-11-01', '2023-11-30', 10.0, 1);

/*--insert product_variants
--máy lạnh
--insert product_variants*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO001000', 'PRO001000', 'DISC00001', '1 PH', 6990000, 100, 1, 1, 1);

INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO002000', 'PRO002000', 'DISC00001', '1.5 PH', 6990000, 200, 1, 0, 1);

INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO003000', 'PRO003000', 'DISC00001', '1 PH', 6690000, 100, 1, 1, 1);

INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO004000', 'PRO004000', 'DISC00001', '1 PH', 6990000, 200, 1, 0, 1);

INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO005000', 'PRO005000', 'DISC00001', '1.5 PH', 7990000, 100, 1, 1, 1);

/*máy giặt*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO006000', 'PRO006000', 'DISC00002', '7.5 Kg', 3790000, 100, 1, 1, 1);
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO007000', 'PRO007000', 'DISC00002', '10 Kg - Đen', 11590000, 100, 1, 1, 1);
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO008000', 'PRO008000', 'DISC00002', '10 Kg', 11490000, 100, 1, 1, 1);
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO009000', 'PRO009000', 'DISC00002', '8 Kg - Trắng', 4990000, 100, 1, 1, 1);
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES ('PRO010000', 'PRO010000', 'DISC00002', '10 Kg - Đen', 10890000, 100, 1, 1, 1);

/*tivi*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO011000', 'PRO011000', 'DISC00003', '58 inch', 7970000, 100, 1, 1, 1),
('PRO012000', 'PRO012000', 'DISC00003', '55 inch', 11990000, 100, 1, 1, 1);

/*điện thoại*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO013100', 'PRO013000', 'DISC00004', 'Hồng nhạt - 128GB', 22490000, 100, 1, 1, 1),
('PRO013200', 'PRO013000', 'DISC00004', 'Hồng nhạt - 128GB', 25490000, 100, 1, 1, 1),
('PRO014100', 'PRO014000', 'DISC00004', 'Xanh lá - 12GB', 11990000, 100, 1, 1, 1),
('PRO014200', 'PRO014000', 'DISC00004', 'Xanh lá - 8GB', 10990000, 100, 1, 1, 1);

/*laptop*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO015000', 'PRO015000', 'DISC00005', 'Xám', 7990000, 100, 1, 1, 1),
('PRO016000', 'PRO016000', 'DISC00005', 'Đen', 25490000, 100, 1, 1, 1);

/*tablet*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO017100', 'PRO017000', 'DISC00006', 'Bạc-64GB', 7990000, 100, 1, 1, 1),
('PRO017200', 'PRO017000', 'DISC00006', 'Xám-64GB', 7990000, 100, 1, 1, 1),
('PRO018100', 'PRO018000', 'DISC00006', '64GB', 17490000, 100, 1, 1, 1),
('PRO018200', 'PRO018000', 'DISC00006', '256GB', 23390000, 100, 1, 1, 1),
('PRO027100', 'PRO027000', 'DISC00006', 'Xám', 3490000, 100, 1, 0, 1),
('PRO027200', 'PRO027000', 'DISC00006', 'Bạc', 3490000, 100, 1, 0, 1);



/*tủ lạnh*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO019000', 'PRO019000', 'DISC00007', 'Xám', 17690000, 100, 1, 1, 1),
('PRO020000', 'PRO020000', 'DISC00007', 'Đen', 19990000, 100, 1, 1, 1);

/*nồi cơm*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO021000', 'PRO021000', 'DISC00008', 'Trắng', 1485000, 100, 1, 1, 1),
('PRO022000', 'PRO022000', 'DISC00008', 'Vàng đồng', 600000, 100, 1, 1, 1);

/*nồi chiên*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO023000', 'PRO023000', 'DISC00009', 'Đen', 1590000, 100, 1, 1, 1),
('PRO024000', 'PRO024000', 'DISC00009', 'Đen', 1290000, 100, 1, 1, 1);

/*bếp điện*/
INSERT INTO product_variants (product_variant_id, product_id, discount_id, product_variant_name, product_variant_price, product_variant_available, product_variant_is_stock, product_variant_is_bestseller, product_variant_is_display)
VALUES 
('PRO025100', 'PRO025000', 'DISC00010', 'Bếp từ hồng ngoại', 7390000, 100, 1, 1, 1),
('PRO025200', 'PRO025000', 'DISC00010', 'Bếp từ đôi', 7390000, 100, 1, 1, 1),
('PRO026000', 'PRO026000', 'DISC00010', 'Đen', 23190000, 100, 1, 1, 1);


/*--insert product_details
--máy lạnh
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO001000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET001001', 'PRO001000', 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter'),
    ('DET001002', 'PRO001000', 'Công suất làm lạnh', '1 HP - 9.500 BTU'),
    ('DET001003', 'PRO001000', 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)'),
    ('DET001004', 'PRO001000', 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio'),
    ('DET001005', 'PRO001000', 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro'),
    ('DET001006', 'PRO001000', 'Làm lạnh nhanh', 'Boost'),
    ('DET001007', 'PRO001000', 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED'),
    ('DET001008', 'PRO001000', 'Tiêu thụ điện', '0.75 kW/h5 sao (Hiệu suất năng lượng 4.48)'),
    ('DET001009', 'PRO001000', 'Dàn lạnh', 'Dài 72.6 cm - Cao 29.1 cm - Dày 21 cm - Nặng 8.2 kg'),
    ('DET001010', 'PRO001000', 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 26.2 cm - Nặng 21.7 kg'),
    ('DET001011', 'PRO001000', 'Hãng', 'Midea.');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO002000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET002001', 'PRO002000', 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter'),
    ('DET002002', 'PRO002000', 'Công suất làm lạnh', '1.5 HP - 12.000 BTU'),
    ('DET002003', 'PRO002000', 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)'),
    ('DET002004', 'PRO002000', 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc HD giúp lọc sạch không khí'),
    ('DET002005', 'PRO002000', 'Công nghệ tiết kiệm điện', 'AI InverterEco'),
    ('DET002006', 'PRO002000', 'Làm lạnh nhanh', 'Turbo'),
    ('DET002007', 'PRO002000', 'Tiện ích', 'Chế độ bảo vệ nguồn điệnChế độ kiểm soát độ ẩmCảm biến nhiệt độ I FeelMàn hình hiển thị nhiệt độ trên dàn lạnhĐảo gió đa chiều tạo luồng không khí lạnh lan tỏa nhanh khắp phòng'),
    ('DET002008', 'PRO002000', 'Tiêu thụ điện', '1.13 kW/h5 sao (Hiệu suất năng lượng 4.41)'),
    ('DET002009', 'PRO002000', 'Dàn lạnh', 'Dài 78.2 cm - Cao 24.8 cm - Dày 19.6 cm - Nặng 7.5 kg'),
    ('DET002010', 'PRO002000', 'Dàn nóng', 'Dài 75.4 cm - Cao 44 cm - Dày 22.4 cm - Nặng 20 kg'),
    ('DET002011', 'PRO002000', 'Hãng', 'TCL');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO003000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET003001', 'PRO003000', 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter'),
    ('DET003002', 'PRO003000', 'Công suất làm lạnh', '1 HP - 9.000 BTU'),
    ('DET003003', 'PRO003000', 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)'),
    ('DET003004', 'PRO003000', 'Lọc bụi, kháng khuẩn, khử mùi', 'Lưới lọc Nano Ag'),
    ('DET003005', 'PRO003000', 'Công nghệ tiết kiệm điện', 'EcoInverter'),
    ('DET003006', 'PRO003000', 'Làm lạnh nhanh', 'Turbo'),
    ('DET003007', 'PRO003000', 'Tiện ích', 'Chức năng tự chẩn đoán lỗiChức năng tự làm sạchMàn hình hiển thị nhiệt độ trên dàn lạnhSleep ModeTự khởi động lại khi có điệcầu điện trở lại'),
    ('DET003008', 'PRO003000', 'Tiêu thụ điện', '0.745 kW/h5 sao (Hiệu suất năng lượng 4.50 )'),
    ('DET003009', 'PRO003000', 'Dàn lạnh', 'Dài 72.5 cm - Cao 28.5 cm - Dày 19.4 cm - Nặng 7.4 kg'),
    ('DET003010', 'PRO003000', 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 25.5 cm - Nặng 21.7 kg'),
    ('DET003011', 'PRO003000', 'Hãng', 'Funiki');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO004000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET004001', 'PRO004000', 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter'),
    ('DET004002', 'PRO004000', 'Công suất làm lạnh', '1 HP - 9.000 BTU'),
    ('DET004003', 'PRO004000', 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)'),
    ('DET004004', 'PRO004000', 'Công nghệ tiết kiệm điện', 'Công nghệ I-saving'),
    ('DET004005', 'PRO004000', 'Làm lạnh nhanh', 'Turbo'),
    ('DET004006', 'PRO004000', 'Tiện ích', 'Chức năng tự động làm sạch iCleanCơ chế bảo vệ an toàn kép phát hiện rò rỉ thông minhCảm biến nhiệt độ iFeelMàn hình hiển thị nhiệt độ trên dàn lạnhTự khởi động lại khi có điệcầu điện trở lại'),
    ('DET004007', 'PRO004000', 'Tiêu thụ điện', '0.98 kW/h5 sao (Hiệu suất năng lượng 4.31)'),
    ('DET004008', 'PRO004000', 'Dàn lạnh', 'Dài 70.8 cm - Cao 28.2 cm - Dày 19.3 cm - Nặng 6.5 kg'),
    ('DET004009', 'PRO004000', 'Dàn nóng', 'Dài 72.7 cm - Cao 45.5 cm - Dày 24.2 cm - Nặng 17.5 kg'),
    ('DET004010', 'PRO004000', 'Hãng', 'Casper');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO005000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET005001', 'PRO005000', 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter'),
    ('DET005002', 'PRO005000', 'Công suất làm lạnh', '1.5 HP - 12.000 BTU'),
    ('DET005003', 'PRO005000', 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)'),
    ('DET005004', 'PRO005000', 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio'),
    ('DET005005', 'PRO005000', 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro'),
    ('DET005006', 'PRO005000', 'Làm lạnh nhanh', 'Boost'),
    ('DET005007', 'PRO005000', 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED'),
    ('DET005008', 'PRO005000', 'Tiêu thụ điện', '1.06 kW/h5 sao (Hiệu suất năng lượng 4.87)'),
    ('DET005009', 'PRO005000', 'Dàn lạnh', 'Dài 83.5 cm - Cao 29.5 cm - Dày 20.8 cm - Nặng 9 kg'),
    ('DET005010', 'PRO005000', 'Dàn nóng', 'Dài 72 cm - Cao 49.5 cm - Dày 27 cm - Nặng 21.2 kg'),
    ('DET005011', 'PRO005000', 'Hãng', 'Midea');

/*máy giặt
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO006000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET006001', 'PRO006000', 'Loại máy', 'Cửa trênLồng đứng'),
    ('DET006002', 'PRO006000', 'Khối lượng giặt', '7.5 KgTừ 2 - 3 người'),
    ('DET006003', 'PRO006000', 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)'),
    ('DET006004', 'PRO006000', 'Công nghệ giặt', 'Công nghệ Fuzzy LogicHệ thống xoáy nước 3 chiều'),
    ('DET006005', 'PRO006000', 'Tiện ích', 'Hẹn giờ giặtKhóa trẻ emTự khởi động lại khi có điện'),
    ('DET006006', 'PRO006000', 'Bảng điều khiển', 'Tiếng Việt nút nhấn'),
    ('DET006007', 'PRO006000', 'Chất liệu lồng giặt', 'Thép không gỉ'),
    ('DET006008', 'PRO006000', 'Kích thước - Khối lượng', 'Cao 91.1 cm - Ngang 53.7 cm - Sâu 55 cm - Nặng 29 kg'),
    ('DET006009', 'PRO006000', 'Hãng', 'Sharp');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO007000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET007001', 'PRO007000', 'Loại máy', 'Cửa trướcLồng ngangCó Inverter'),
    ('DET007002', 'PRO007000', 'Khối lượng giặt', '10 KgTừ 5 - 7 người'),
    ('DET007003', 'PRO007000', 'Kiểu động cơ', 'Truyền động trực tiếp'),
    ('DET007004', 'PRO007000', 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt tiết kiệm TurboWash'),
    ('DET007005', 'PRO007000', 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng LG ThinQChẩn đoán lỗi Smart DiagnosisHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặtVệ sinh lồng giặt'),
    ('DET007006', 'PRO007000', 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị'),
    ('DET007007', 'PRO007000', 'Chất liệu lồng giặt', 'Thép không gỉ'),
    ('DET007008', 'PRO007000', 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 59.2 cm - Sâu 60 cm - Nặng 70 kg'),
    ('DET007009', 'PRO007000', 'Hãng', 'LG');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO008000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET008001', 'PRO008000', 'Loại máy', 'Cửa trướcLồng ngangCó Inverter'),
    ('DET008002', 'PRO008000', 'Khối lượng giặt', '10 KgTừ 5 - 7 người'),
    ('DET008003', 'PRO008000', 'Kiểu động cơ', 'Truyền động trực tiếp - sử dụng trí tuệ nhân tạo'),
    ('DET008004', 'PRO008000', 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt 6 motion DDCông nghệ giặt hơi nước Steam (cửa trước)Công nghệ giặt tiết kiệm TurboWash'),
    ('DET008005', 'PRO008000', 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng SmartThinQHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặt'),
    ('DET008006', 'PRO008000', 'Bảng điều khiển', 'Song ngữ Anh - Việt, có nút xoay, màn hình hiển thị'),
    ('DET008007', 'PRO008000', 'Chất liệu lồng giặt', 'Thép không gỉ'),
    ('DET008008', 'PRO008000', 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 58.5 cm - Nặng 80 kg'),
    ('DET008009', 'PRO008000', 'Hãng', 'LG');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO009000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET009001', 'PRO009000', 'Loại máy', 'Cửa trướcLồng ngangCó Inverter'),
    ('DET009002', 'PRO009000', 'Khối lượng giặt', '8 KgTừ 3 - 5 người'),
    ('DET009003', 'PRO009000', 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)'),
    ('DET009004', 'PRO009000', 'Công nghệ giặt', 'Công nghệ cảm biến thông minh 6th SENSESanitize Wash - Chương trình giặt sát khuẩn loại bỏ vi khuẩn'),
    ('DET009005', 'PRO009000', 'Tiện ích', 'Chống nhănKhóa trẻ emKhử trùng lồng giặt ở 90°CThêm đồ trong khi giặtTự khởi động lại khi có điện'),
    ('DET009006', 'PRO009000', 'Bảng điều khiển', 'Tiếng Anh cảm ứng có màn hình hiển thị'),
    ('DET009007', 'PRO009000', 'Chất liệu lồng giặt', 'Thép không gỉ'),
    ('DET009008', 'PRO009000', 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 56.5 cm - Nặng 63 kg'),
    ('DET009009', 'PRO009000', 'Hãng', 'Whirlpool');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO010009'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET010001', 'PRO010000', 'Loại máy', 'Cửa trướcLồng ngangCó Inverter'),
    ('DET010002', 'PRO010000', 'Khối lượng giặt', '10 KgTừ 5 - 7 người'),
    ('DET010003', 'PRO010000', 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)'),
    ('DET010004', 'PRO010000', 'Công nghệ giặt', 'AI Dispenser tự động cân chỉnh lượng nước giặt, nước xảAI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặtBảng điều khiển AI control tự động ghi nhớ chế độ giặtCông nghệ giặt bong bóng Eco BubbleGiặt hơi nước Hygiene SteamKết nối với điện thoại thông qua ứng dụng SmartThingsQuickDrive giặt xả hiệu quả chỉ trong 39 phútVRT Plus ™ giảm rung ồn đến 30%'),
    ('DET010005', 'PRO010000', 'Tiện ích', 'Chống nhănKhóa trẻ emTự động vệ sinh lồng giặtVệ sinh lồng giặt'),
    ('DET010006', 'PRO010000', 'Bảng điều khiển', 'Tiếng Việt'),
    ('DET010007', 'PRO010000', 'Chất liệu lồng giặt', 'Thép không gỉ'),
    ('DET010008', 'PRO010000', 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 62.5 cm - Nặng 67 kg'),
    ('DET010009', 'PRO010000', 'Hãng', 'Samsung');

/*tivi
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO011000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES
    ('DET011001', 'PRO011000', 'Loại máy', 'Google Tivi 58 inch 4K'),
    ('DET011002', 'PRO011000', 'Hệ điều hành', 'Google TV'),
    ('DET011003', 'PRO011000', 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Netflix, Trình duyệt web, VieON, YouTube'),
    ('DET011004', 'PRO011000', 'Công nghệ hình ảnh', 'Game Mode, HDR10, HLG, Smart HDR'),
    ('DET011005', 'PRO011000', 'Điều khiển bằng giọng nói', 'Google Assistant có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt'),
    ('DET011006', 'PRO011000', 'Remote thông minh', 'Remote tích hợp micro tìm kiếm bằng giọng nói'),
    ('DET011007', 'PRO011000', 'Chiếu hình từ điện thoại lên TV', 'Chromecast, T-Cast'),
    ('DET011008', 'PRO011000', 'Kích thước', 'Ngang 128.5 cm - Cao 80.1 cm - Dày 12.85 cm'),
    ('DET011009', 'PRO011000', 'Năm ra mắt', '2022'),
    ('DET011010', 'PRO011000', 'Hãng', 'TCL');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO012000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET012001', 'PRO012000', 'Loại máy', 'Smart Tivi QLED 55 inch 4K'),
    ('DET012002', 'PRO012000', 'Hệ điều hành', 'Tizen™'),
    ('DET012003', 'PRO012000', 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Galaxy Play (Fim+), MP3 Zing, MyTV, Netflix, POPS Kids, Spotify, Trình duyệt web, VieON, YouTube'),
    ('DET012004', 'PRO012000', 'Công nghệ hình ảnh', 'Ambient Mode, Brightness/Color Detection, Chuyển động mượt Motion Xcelerator Turbo, Giảm độ trễ chơi game Auto Low Latency Mode (ALLM), HDR10+, Quantum Dot, Quantum HDR, Super Ultra Wide Game View & Game Bar, Supreme UHD Dimming'),
    ('DET012005', 'PRO012000', 'Điều khiển bằng giọng nói', 'Bixby có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt'),
    ('DET012006', 'PRO012000', 'Remote thông minh', 'One Remote sạc qua USB C & ánh sáng'),
    ('DET012007', 'PRO012000', 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2, Tap View'),
    ('DET012008', 'PRO012000', 'Kích thước', 'Ngang 123.2 cm - Cao 76.4 cm - Dày 24.9 cm'),
    ('DET012009', 'PRO012000', 'Năm ra mắt', '2021'),
    ('DET012010', 'PRO012000', 'Hãng', 'Samsung');

/*điện thoại
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO013000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET013001', 'PRO013000', 'Màn hình', 'OLED 6.1" Super Retina XDR'),
    ('DET013002', 'PRO013000', 'Hệ điều hành', 'iOS 17'),
    ('DET013003', 'PRO013000', 'Camera sau', 'Chính 48 MP & Phụ 12 MP'),
    ('DET013004', 'PRO013000', 'Camera trước', '12 MP'),
    ('DET013005', 'PRO013000', 'Chip', 'Apple A16 Bionic'),
    ('DET013006', 'PRO013000', 'RAM', '6 GB'),
    ('DET013007', 'PRO013000', 'Dung lượng lưu trữ', '256 GB'),
    ('DET013008', 'PRO013000', 'SIM', '1 Nano SIM & 1 eSIM, Hỗ trợ 5G'),
    ('DET013009', 'PRO013000', 'Pin, Sạc', '3349 mAh, 20 W');
/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO014000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET014001', 'PRO014000', 'Màn hình', 'AMOLED 6.67" 1.5K'),
    ('DET014002', 'PRO014000', 'Hệ điều hành', 'Android 13'),
    ('DET014003', 'PRO014000', 'Camera sau', 'Chính 50 MP & Phụ 50 MP, 12 MP'),
    ('DET014004', 'PRO014000', 'Camera trước', '20 MP'),
    ('DET014005', 'PRO014000', 'Chip', 'MediaTek Dimensity 8200-Ultra'),
    ('DET014006', 'PRO014000', 'RAM', '12 GB'),
    ('DET014007', 'PRO014000', 'Dung lượng lưu trữ', '256 GB'),
    ('DET014008', 'PRO014000', 'SIM', '2 Nano SIM, Hỗ trợ 5G'),
    ('DET014009', 'PRO014000', 'Pin, Sạc', '5000 mAh, 67 W');

/*laptop
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO015000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET015001', 'PRO015000', 'CPU', 'i3-1115G4 3GHz'),
    ('DET015002', 'PRO015000', 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống) 3200 MHz'),
    ('DET015003', 'PRO015000', 'Ổ cứng', '256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))'),
    ('DET015004', 'PRO015000', 'Màn hình', '15.6" Full HD (1920 x 1080)'),
    ('DET015005', 'PRO015000', 'Card màn hình', 'Card tích hợp Intel UHD'),
    ('DET015006', 'PRO015000', 'Cổng kết nối', '1 x USB 2.0, 1 x USB 3.2, 1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu), HDMI, Jack tai nghe 3.5 mm'),
    ('DET015007', 'PRO015000', 'Hệ điều hành', 'Windows 11 Home SL'),
    ('DET015008', 'PRO015000', 'Thiết kế', 'Vỏ nhựa'),
    ('DET015009', 'PRO015000', 'Kích thước, khối lượng', 'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.65 kg'),
    ('DET015010', 'PRO015000', 'Thời điểm ra mắt', '2023');
/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO016009'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET016001', 'PRO016000', 'CPU', 'i7-12700H 2.30 GHz'),
    ('DET016002', 'PRO016000', 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz'),
    ('DET016003', 'PRO016000', 'Ổ cứng', '512 GB SSD NVMe PCIe 4.0 (Có thể tháo ra, lắp thanh khác tối đa 1 TB), Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 1 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng'),
    ('DET016004', 'PRO016000', 'Màn hình', '15.6" Full HD (1920 x 1080) 144Hz'),
    ('DET016005', 'PRO016000', 'Card màn hình', 'Card rời RTX 3050 4GB'),
    ('DET016006', 'PRO016000', 'Cổng kết nối', '1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), 3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)'),
    ('DET016007', 'PRO016000', 'Đặc biệt', 'Có đèn bàn phím'),
    ('DET016008', 'PRO016000', 'Hệ điều hành', 'Windows 11 Home SL'),
    ('DET016009', 'PRO016000', 'Thiết kế', 'Vỏ nhựa'),
    ('DET016010', 'PRO016000', 'Kích thước, khối lượng', 'Dài 360.4 mm - Rộng 271.00 mm - Dày 25.9 mm - Nặng 2.5 kg'),
    ('DET016011', 'PRO016000', 'Thời điểm ra mắt', '2022');

/*tablet
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO017000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET017001', 'PRO017000', 'Màn hình', '10.2" Retina IPS LCD'),
    ('DET017002', 'PRO017000', 'Hệ điều hành', 'iPadOS 15'),
    ('DET017003', 'PRO017000', 'Chip', 'Apple A13 Bionic'),
    ('DET017004', 'PRO017000', 'RAM', '3 GB'),
    ('DET017005', 'PRO017000', 'Dung lượng lưu trữ', '64 GB'),
    ('DET017006', 'PRO017000', 'Kết nối', 'Nghe gọi qua FaceTime'),
    ('DET017007', 'PRO017000', 'Camera sau', '8 MP'),
    ('DET017008', 'PRO017000', 'Camera trước', '12 MP'),
    ('DET017009', 'PRO017000', 'Pin, Sạc', '32.4 Wh (~8600 mAh), 20 W');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO018000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET018001', 'PRO018000', 'Màn hình', '10.9" Retina IPS LCD'),
    ('DET018002', 'PRO018000', 'Hệ điều hành', 'iPadOS 15'),
    ('DET018003', 'PRO018000', 'Chip', 'Apple M1'),
    ('DET018004', 'PRO018000', 'RAM', '8 GB'),
    ('DET018005', 'PRO018000', 'Dung lượng lưu trữ', '64 GB'),
    ('DET018006', 'PRO018000', 'Kết nối', '5G, Nghe gọi qua FaceTime'),
    ('DET018007', 'PRO018000', 'SIM', '1 Nano SIM & 1 eSIM'),
    ('DET018008', 'PRO018000', 'Camera sau', '12 MP'),
    ('DET018009', 'PRO018000', 'Camera trước', '12 MP'),
    ('DET018010', 'PRO018000', 'Pin, Sạc', '28.6 Wh (~7587 mAh), 20 W');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO027000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET027001', 'PRO027000', 'Màn hình', '8.7"TFT LCD'),
    ('DET027002', 'PRO027000', 'Hệ điều hành', 'Android 11'),
    ('DET027003', 'PRO027000', 'Chip', 'MediaTek MT8768T'),
    ('DET027004', 'PRO027000', 'RAM', '3 GB'),
    ('DET027005', 'PRO027000', 'Dung lượng lưu trữ', '32 GB'),
    ('DET027006', 'PRO027000', 'Kết nối', 'Hỗ trợ 4G, Có nghe gọi'),
    ('DET027007', 'PRO027000', 'SIM', '1 Nano SIM'),
    ('DET027008', 'PRO027000', 'Camera sau', '8 MP'),
    ('DET027009', 'PRO027000', 'Camera trước', '2 MP'),
    ('DET027010', 'PRO027000', 'Pin, Sạc', '5100 mAh, 15 W'),
    ('DET027011', 'PRO027000', 'Hãng', 'Samsung');


/*tủ lạnh
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO019009'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET019001', 'PRO019000', 'Kiểu tủ', 'Multi Door'),
    ('DET019002', 'PRO019000', 'Dung tích sử dụng', '488 lít - 4 - 5 người'),
    ('DET019003', 'PRO019000', 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Digital Inverter'),
    ('DET019004', 'PRO019000', 'Công nghệ làm lạnh', '2 dàn lạnh độc lập Twin Cooling Plus™, Công nghệ làm lạnh No Frost, Làm lạnh nhanh'),
    ('DET019005', 'PRO019000', 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc than hoạt tính Deodorizer'),
    ('DET019006', 'PRO019000', 'Công nghệ bảo quản thực phẩm', 'Ngăn rau quả giữ ẩm'),
    ('DET019007', 'PRO019000', 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ kỳ nghỉ, Có khóa, Làm đông nhanh'),
    ('DET019008', 'PRO019000', 'Kích thước - Khối lượng', 'Cao 179.3 cm - Rộng 83.3 cm - Sâu 74 cm - Nặng 99 kg'),
    ('DET019009', 'PRO019000', 'Nơi sản xuất', 'Trung Quốc'),
    ('DET019010', 'PRO019000', 'Năm ra mắt', '2021'),
    ('DET019011', 'PRO019000', 'Hãng', 'Samsung');
/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO020000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET020001', 'PRO020000', 'Kiểu tủ', 'Multi Door'),
    ('DET020002', 'PRO020000', 'Dung tích sử dụng', '511 lít - 4 - 5 người'),
    ('DET020003', 'PRO020000', 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Origin Inverter'),
    ('DET020004', 'PRO020000', 'Công nghệ làm lạnh', 'Công nghệ 2 dàn lạnh độc lập, Tấm hợp kim giữ nhiệt Alloy Cooling'),
    ('DET020005', 'PRO020000', 'Công nghệ kháng khuẩn khử mùi', 'Công nghệ PureBio kết hợp tia Plasma'),
    ('DET020006', 'PRO020000', 'Công nghệ bảo quản thực phẩm', 'Giữ nguyên hương vị với Flexible Zone, Tăng cường dưỡng chất với Moisture Zone'),
    ('DET020007', 'PRO020000', 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ cấp đông nhanh, Có khóa, Làm lạnh nhanh, Ngăn giữ hương vị không cần rã đông Flexible Zone'),
    ('DET020008', 'PRO020000', 'Kích thước - Khối lượng', 'Cao 189.8 cm - Rộng 83.3 cm - Sâu 64.8 cm - Nặng 107 kg'),
    ('DET020009', 'PRO020000', 'Nơi sản xuất', 'Trung Quốc'),
    ('DET020010', 'PRO020000', 'Năm ra mắt', '2020'),
    ('DET020011', 'PRO020000', 'Hãng', 'Toshiba');

/*nồi cơm
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO021000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET021001', 'PRO021000', 'Loại nồi', 'Nồi cơm điện tử'),
    ('DET021002', 'PRO021000', 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người'),
    ('DET021003', 'PRO021000', 'Công suất', '790 - 940W'),
    ('DET021004', 'PRO021000', 'Lòng nồi dày', '1.427 mm, Hợp kim phủ đá Maifan chống dính (Bakuhanseki)'),
    ('DET021005', 'PRO021000', 'Điều khiển', 'Nút nhấn có màn hình hiển thị'),
    ('DET021006', 'PRO021000', 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ 24 giờ'),
    ('DET021007', 'PRO021000', 'Thương hiệu của', 'Hà Lan'),
    ('DET021008', 'PRO021000', 'Hãng', 'Philips');
/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO022000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET022001', 'PRO022000', 'Loại nồi', 'Nồi cơm nắp gài'),
    ('DET022002', 'PRO022000', 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người'),
    ('DET022003', 'PRO022000', 'Công suất', '700W'),
    ('DET022004', 'PRO022000', 'Lòng nồi dày', '1.5 mm, Hợp kim nhôm phủ chống dính'),
    ('DET022005', 'PRO022000', 'Điều khiển', 'Nút gạt'),
    ('DET022006', 'PRO022000', 'Tiện ích', 'Có xửng hấp'),
    ('DET022007', 'PRO022000', 'Thương hiệu của', 'Singapore'),
    ('DET022008', 'PRO022000', 'Hãng', 'BlueStone');

/*nồi chiên
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO023000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET023001', 'PRO023000', 'Dung tích tổng', '12 lít'),
    ('DET023002', 'PRO023000', 'Dung tích sử dụng', '12 lít'),
    ('DET023003', 'PRO023000', 'Điều chỉnh', '80 - 200°C, 0 - 60 phút'),
    ('DET023004', 'PRO023000', 'Phụ kiện chính', '2 vỉ nướng, Giỏ chiên, Khay nướng, Khay xiên quay, Tay cầm, Xiên nướng gà'),
    ('DET023005', 'PRO023000', 'Chất liệu nồi', 'Khoang lò thép mạ kẽm, Vỏ nhựa ABS'),
    ('DET023006', 'PRO023000', 'Công nghệ, công suất', 'Thanh nhiệt điện trở 1800W'),
    ('DET023007', 'PRO023000', 'Chức năng nấu', 'Chiên, nướng thực phẩm'),
    ('DET023008', 'PRO023000', 'Bảng điều khiển', 'Nút xoay'),
    ('DET023009', 'PRO023000', 'Tiện ích', 'Có đèn báo hoạt động, Nắp kính trong suốt, quan sát được quá trình nấu, Quạt đối lưu, Đèn trong khoang lò'),
    ('DET023010', 'PRO023000', 'Năm ra mắt', '2023'),
    ('DET023011', 'PRO023000', 'Thương hiệu của', 'Ý'),
    ('DET023012', 'PRO023000', 'Hãng', 'Ferroli');
/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO024000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET024001', 'PRO024000', 'Dung tích tổng', '4 lít'),
    ('DET024002', 'PRO024000', 'Dung tích sử dụng', '3.5 lít'),
    ('DET024003', 'PRO024000', 'Điều chỉnh', '80 - 200°C, 0 - 30 phút'),
    ('DET024004', 'PRO024000', 'Phụ kiện chính', 'Rổ chiên'),
    ('DET024005', 'PRO024000', 'Chất liệu nồi', 'Khay chiên phủ chống dính Ceramic'),
    ('DET024006', 'PRO024000', 'Công nghệ, công suất', 'Làm nóng điện trở nhiệt 1400W'),
    ('DET024007', 'PRO024000', 'Chức năng nấu', 'Chiên, nướng thực phẩm'),
    ('DET024008', 'PRO024000', 'Bảng điều khiển', 'Nút xoay'),
    ('DET024000', 'PRO024000', 'Tiện ích', 'Tay cầm bọc nhựa cách nhiệt, Tự ngắt khi quá nhiệt, Tự động ngắt khi kéo lòng nồi'),
    ('DET024010', 'PRO024000', 'Năm ra mắt', '2019'),
    ('DET024011', 'PRO024000', 'Thương hiệu của', 'Việt Nam'),
    ('DET024012', 'PRO024000', 'Hãng', 'Kangaroo');

/*bếp điện
-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO025000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET025001', 'PRO025000', 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB'),
    ('DET025002', 'PRO025000', 'Công suất vùng nấu', 'Hồng ngoại: 2200W - Từ: 2200/3000W'),
    ('DET025003', 'PRO025000', 'Chất liệu mặt bếp', 'Kính Ceramic - K+ (Pháp)'),
    ('DET025004', 'PRO025000', 'Bảng điều khiển', 'Cảm ứng'),
    ('DET025005', 'PRO025000', 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi'),
    ('DET025006', 'PRO025000', 'Tính năng an toàn', 'Cảnh báo khi không có nồi, Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi điện áp quá cao/thấp, Tự tắt bếp khi nước tràn đến bảng điều khiển, Tự tắt khi không sử dụng'),
    ('DET025007', 'PRO025000', 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện'),
    ('DET025008', 'PRO025000', 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 39 cm'),
    ('DET025009', 'PRO025000', 'Thương hiệu của', 'Đức'),
    ('DET025010', 'PRO025000', 'Hãng', 'Pramie');

/*-- Chèn các chi tiết sản phẩm cho sản phẩm có product_id = 'PRO026000'*/
INSERT INTO product_details (product_detail_id, product_id, product_detail_name, product_detail_value)
VALUES 
    ('DET026001', 'PRO026000', 'Loại bếp', 'Bếp hồng ngoại 3 vùng nấu, Bếp âm cần lắp CB'),
    ('DET026002', 'PRO026000', 'Công suất vùng nấu', 'Trái dưới: 1800W - Trái trên: 1200W - Phải: 1050 - 1950 - 2700W'),
    ('DET026003', 'PRO026000', 'Chất liệu mặt bếp', 'Kính Ceramic - Smeg (Ý)'),
    ('DET026004', 'PRO026000', 'Bảng điều khiển', 'Cảm ứng'),
    ('DET026005', 'PRO026000', 'Loại nồi nấu', 'Tất cả loại nồi'),
    ('DET026006', 'PRO026000', 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự tắt bếp khi nước tràn đến bảng điều khiển'),
    ('DET026007', 'PRO026000', 'Tiện ích', 'Có hẹn giờ'),
    ('DET026008', 'PRO026000', 'Kích thước lỗ đá', 'Ngang 56 cm - Dọc 49 cm'),
    ('DET026009', 'PRO026000', 'Thương hiệu của', 'Ý'),
    ('DET026010', 'PRO026000', 'Hãng', 'Smeg');

-- Bảng Images
INSERT INTO images (image_id, product_variant_id, image_name, image_is_display)
VALUES 
('PRO010001', 'PRO010000', 'Ảnh 1', 1),
('PRO010002', 'PRO010000', 'Ảnh 2', 1),
('PRO010003', 'PRO010000', 'Ảnh 3', 1),
('PRO010004', 'PRO010000', 'Ảnh 4', 1),
('PRO010005', 'PRO010000', 'Ảnh 5', 1);


-- Bảng users
INSERT INTO users (user_id, user_login_name, user_password, user_name, user_birth, user_sex, user_email, user_phone, user_address, user_active)
VALUES
('U00000001', '0987654321', '123456', 'Nguyễn Văn An', '1990-01-01', 1, 'user1@example.com', '0987654321', 'Kiên Giang', 1),
('U00000002', '0987654322', '123456', 'Trần Thị Bình', '1991-02-02', 0, 'user2@example.com', '0987654322', 'TP. Hồ Chí Minh', 1),
('U00000003', '0987654323', '123456', 'Lê Quang Yên', '1990-01-01', 1, 'user3@example.com', '0987654323', 'Hà Nội', 1),
('U00000004', '0987654324', '123456', 'Trương Quang Phú', '1990-01-01', 1, 'user4@example.com', '0987654324', 'Hải Dương', 1),
('U00000005', '0987654325', '123456', 'Trần Thiên Lọc', '1990-01-01', 1, 'user5@example.com', '0987654325', 'Hà Nội', 1),
('U00000006', '0987654326', '123456', 'Nguyễn Phú Cường', '1999-03-03', 1, 'user6@example.com', '0987654326', 'Đà Nẵng', 1),
('U00000007', '0987654327', '123456', 'Phan Thanh Danh', '1999-03-03', 1, 'user7@example.com', '0987654327', 'Đồng Nai', 1),
('U00000008', '0987654328', '123456', 'Mai Văn Tiên', '1999-03-03', 1, 'user8@example.com', '0987654328', 'Đà Nẵng', 1),
('U00000009', '0987654329', '123456', 'Tô Thanh Lộc', '1999-03-03', 1, 'user9@example.com', '0987654329', 'Bình Phước', 1),
('U00000010', '0987654330', '123456', 'Nguyễn Nhựt Tiến', '1999-03-03', 1, 'user10@example.com', '0987654330', 'Cần Thơ', 1),
('U00000011', '0987654331', '123456', 'Lý Văn Nghĩa', '1999-03-03', 1, 'user11@example.com', '0987654331', 'Huế', 1),
('U00000012', '0987654332', '123456', 'Hồ Thị Mai', '1999-03-03', 1, 'user12@example.com', '0987654332', 'Bình Dương', 1),
('U00000013', '0987654333', '123456', 'Lê Bích Tuyền', '1999-03-03', 1, 'user13@example.com', '0987654333', 'Bình Dương', 1),
('U00000014', '0987654334', '123456', 'Lê Hồng Bảo Trinh', '1999-03-03', 1, 'user14@example.com', '0987654334', 'Bình Dương', 1),
('U00000015', '0987654335', '123456', 'Nguyễn Hoàng PHương Linh', '1999-03-03', 1, 'user15@example.com', '0987654335', 'Bình Dương', 1);

-- Bảng Customer
INSERT INTO customers (customer_id, user_id)
VALUES
('CUS000001', 'U00000001'),
('CUS000002', 'U00000002'),
('CUS000003', 'U00000003'),
('CUS000004', 'U00000004'),
('CUS000005', 'U00000005'),
('CUS000006', 'U00000006'),
('CUS000007', 'U00000007'),
('CUS000008', 'U00000008'),
('CUS000009', 'U00000009'),
('CUS000010', 'U00000010');

-- Bảng Staff
INSERT INTO staffs (staff_id, user_id, staff_role, staff_description)
VALUES
('STF000001', 'U00000011', 'Giám đốc', 'Chịu trách nhiệm quản lý chung công ty'),
('STF000002', 'U00000012', 'Trưởng phòng kinh doanh', 'Chịu trách nhiệm quản lý hoạt động kinh doanh của công ty'),
('STF000003', 'U00000013', 'Nhân viên kinh doanh', 'Chịu trách nhiệm bán hàng và phát triển khách hàng'),
('STF000004', 'U00000014', 'Nhân viên kỹ thuật', 'Chịu trách nhiệm hỗ trợ kỹ thuật cho khách hàng'),
('STF000005', 'U00000015', 'Nhân viên chăm sóc khách hàng', 'Chịu trách nhiệm chăm sóc khách hàng và giải quyết các vấn đề của khách hàng');

-- Bảng carts
INSERT INTO carts (customer_id, product_variant_id, cart_quanity)
VALUES
  ('CUS000001', 'PRO001000', 1),
  ('CUS000002', 'PRO002000', 2),
  ('CUS000003', 'PRO003000', 3);

-- Bảng orders
INSERT INTO orders (order_id, customer_id, staff_id, order_date, order_delivery_date, order_delivery_address, order_note, order_is_payment, order_is_delivery)
VALUES
  ('O00000001', 'CUS000001', 'STF000001', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', 1, 0),
  ('O00000002', 'CUS000002', 'STF000002', '2023-11-02', '2023-11-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 0, 1),
  ('O00000003', 'CUS000003', 'STF000003', '2023-11-02', '2023-11-06', '789 Tran Hung Dao Street, Ward 6, District 1, Ho Chi Minh City', 'Đóng gói kỹ', 0, 0),
  ('O00000004', 'CUS000001', 'STF000001', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', 1, 0),
  ('O00000005', 'CUS000001', 'STF000001', '2023-11-02', '2023-11-05', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 0, 1),
  ('O00000006', 'CUS000001', 'STF000003', '2023-11-02', '2023-11-06', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Đóng gói kỹ', 0, 0);

-- Bảng orders_details
INSERT INTO order_details (order_id, product_variant_id, order_detail_quantity, order_detail_unit_price)
VALUES
  ('O00000001', 'PRO001000', 1, 6990000),
  ('O00000002', 'PRO001000', 2, 6990000),
  ('O00000003', 'PRO002000', 2, 6990000),
  ('O00000004', 'PRO003000', 2, 6990000),
  ('O00000005', 'PRO004000', 2, 6990000),
  ('O00000006', 'PRO005000', 2, 6990000);


-- Bảng paying_methods
INSERT INTO paying_methods (paying_method_id, paying_method_name, paying_method_is_display)
VALUES
  ('PMETHOD01', 'Thẻ tín dụng/ghi nợ', 1),
  ('PMETHOD02', 'Chuyển khoản ngân hàng', 1),
  ('PMETHOD03', 'Ví điện tử', 1);

-- Bảng payments
INSERT INTO payments (payment_id, order_id, paying_method_id, payment_date, payment_total, payment_status)
VALUES
  ('P00000001', 'O00000001', 'PMETHOD01', '2023-11-02', 6990000, 1),
  ('P00000002', 'O00000002', 'PMETHOD01', '2023-11-02', 13980000, 1),
  ('P00000003', 'O00000003', 'PMETHOD02', '2023-11-02', 13980000, 1),
  ('P00000004', 'O00000004', 'PMETHOD02', '2023-11-02', 13980000, 0),
  ('P00000005', 'O00000005', 'PMETHOD03', '2023-11-02', 13980000, 0),
  ('P00000006', 'O00000006', 'PMETHOD01', '2023-11-02', 15980000, 0);

-- Bảng feedbacks
INSERT INTO feedbacks (feedback_id, product_variant_id, customer_id, order_id, feedback_date, feedback_rate, feedback_content, feedback_is_display)
VALUES
  ('F0000001', 'PRO001000', 'CUS000001', 'O00000001', '2023-11-02', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
  ('F0000002', 'PRO001100', 'CUS000002', 'O00000002', '2023-11-02', 4, 'Sản phẩm tốt, nhưng thời gian giao hàng hơi lâu.', 1),
  ('F0000003', 'PRO001000', 'CUS000003', 'O00000003', '2023-11-02', 3, 'Sản phẩm bình thường, không quá xuất sắc.', 1);

-- Bảng notification_types
INSERT INTO notification_types (notification_types_id, notification_types_name)
VALUES
  ('NTTYPE001', 'Order placed'),
  ('NTTYPE002', 'Order shipped'),
  ('NTTYPE003', 'Order delivered'),
  ('NTTYPE004', 'Payment received'),
  ('NTTYPE005', 'Feedback received'),
  ('NTTYPE006', 'Sale'),
  ('NTTYPE007', 'Lucky Customer');

-- Bảng notifications
INSERT INTO notifications (notifications_id, notification_types_id, notifications_title, notifications_subtitle, notifications_content, notifications_date, notifications_is_display)
VALUES
  ('NT0000001', 'NTTYPE001', 'Đơn hàng mới', 'Bạn có một đơn hàng mới đang chờ xử lý.', 'Đơn hàng mới đã được đặt thành công. Vui lòng kiểm tra và xử lý đơn hàng.', '2023-11-02', 1),
  ('NT0000002', 'NTTYPE002', 'Đơn hàng đã được vận chuyển', 'Đơn hàng của bạn đã được vận chuyển và đang trên đường đến tay bạn.', 'Đơn hàng đã được vận chuyển thành công. Bạn có thể theo dõi trạng thái đơn hàng tại đây.', '2023-11-02', 1),
  ('NT0000003', 'NTTYPE003', 'Đơn hàng đã được giao', 'Đơn hàng của bạn đã được giao đến địa chỉ của bạn.', 'Đơn hàng đã được giao thành công. Vui lòng kiểm tra và xác nhận đơn hàng.', '2023-11-02', 1),
  ('NT0000004', 'NTTYPE004', 'Thanh toán đã được nhận', 'Thanh toán của bạn cho đơn hàng đã được nhận.', 'Thanh toán đã được nhận thành công. Vui lòng kiểm tra email của bạn để biết thêm chi tiết.', '2023-11-02', 1),
  ('NT0000005', 'NTTYPE005', 'Phản hồi đã được nhận', 'Bạn đã nhận được phản hồi từ khách hàng.', 'Khách hàng đã phản hồi về sản phẩm của bạn. Vui lòng kiểm tra và xử lý phản hồi này.', '2023-11-02', 1),
  ('NT0000006', 'NTTYPE006', 'Giảm giá 50% cho tất cả sản phẩm', 'Cơ hội mua sắm tuyệt vời!', 'Từ ngày 03/11/2023 đến ngày 09/11/2023, chúng tôi giảm giá 50% cho tất cả sản phẩm. Đây là cơ hội tuyệt vời để bạn mua sắm với giá ưu đãi.', '2023-11-02', 1);

-- Bảng User_Notification
INSERT INTO user_notification (user_id, notifications_id, users_notifications_is_read)
VALUES
  ('U00000001', 'NT0000006', 0),
  ('U00000002', 'NT0000006', 0),
  ('U00000003', 'NT0000006', 1),
  ('U00000004', 'NT0000006', 1),
  ('U00000005', 'NT0000006', 1),
  ('U00000006', 'NT0000006', 0),
  ('U00000007', 'NT0000006', 0),
  ('U00000008', 'NT0000006', 0),
  ('U00000009', 'NT0000006', 0),
  ('U00000010', 'NT0000006', 0);

