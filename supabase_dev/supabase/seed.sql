SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."banners" ("id", "created_at", "image_url", "order_index") VALUES
	('1', '2025-06-09 08:12:40.942+00', 'https://zalo-miniapp.github.io/zaui-market/dummy/banner/ads.jpg', 0),
	('2', '2025-06-09 08:12:40.945+00', 'https://zalo-miniapp.github.io/zaui-market/dummy/banner/ads.jpg', 1),
	('3', '2025-06-09 08:12:40.947+00', 'https://zalo-miniapp.github.io/zaui-market/dummy/banner/ads.jpg', 2),
	('4', '2025-06-09 08:12:40.95+00', 'https://zalo-miniapp.github.io/zaui-market/dummy/banner/ads.jpg', 3),
	('5', '2025-06-09 08:12:40.954+00', 'https://zalo-miniapp.github.io/zaui-market/dummy/banner/ads.jpg', 4),
	('6', '2025-06-09 08:57:27.944509+00', 'https://cdn-imgix.headout.com/tour/7064/TOUR-IMAGE/b2c74200-8da7-439a-95b6-9cad1aa18742-4445-dubai-img-worlds-of-adventure-tickets-02.jpeg?auto=format&w=900&h=562.5&q=90&ar=16%3A10&crop=faces%2Ccenter&fit=crop', 2),
	('7', '2025-06-09 09:25:46.164878+00', 'http://127.0.0.1:54321/storage/v1/object/public/uploads//488633989_687733233783431_902771022479772949_n.jpg', 2);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."categories" ("id", "created_at", "name", "image_url") VALUES
	('1', '2025-06-09 08:12:40.724+00', 'Rau, củ, quả', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/fruits.png'),
	('2', '2025-06-09 08:12:40.765+00', 'Thịt', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/meat.png'),
	('3', '2025-06-09 08:12:40.77+00', 'Thủy hải sản', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/fish.png'),
	('4', '2025-06-09 08:12:40.779+00', 'Bơ, sữa, trứng', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/egg.png'),
	('5', '2025-06-09 08:12:40.782+00', 'Bánh tươi', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/bread.png'),
	('6', '2025-06-09 08:12:40.787+00', 'Bánh kẹo ngũ cốc', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/cookies.png'),
	('7', '2025-06-09 08:12:40.792+00', 'Thực phẩm chế biến', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/sushi.png'),
	('8', '2025-06-09 08:12:40.796+00', 'Thực phẩm đông lạnh', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/ice-cream.png'),
	('9', '2025-06-09 08:12:40.808+00', 'Gia vị', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/sauce.png'),
	('10', '2025-06-09 08:12:40.827+00', 'Nước giải khát', 'https://zalo-miniapp.github.io/zaui-market/dummy/category/beverage.png');


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."stations" ("id", "created_at", "name", "image_url", "address", "location_lat", "location_lng") VALUES
	('1', '2025-06-09 08:12:40.958+00', 'Tiệm Tí Hon - Chi nhánh 1', 'https://zalo-miniapp.github.io/zaui-market/dummy/product/apples.png', 'Z06, Số 13, Tân Thuận Đông, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', 10.76874600, 106.72822800),
	('2', '2025-06-09 08:12:40.963+00', 'Tiệm Tí Hon - Chi nhánh 2', 'https://zalo-miniapp.github.io/zaui-market/dummy/product/apples.png', 'Z06, Số 13, Tân Thuận Đông, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', 10.76874600, 106.72822800);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("id", "created_at", "status", "payment_status", "received_at", "total", "note", "delivery_type", "delivery_alias", "delivery_address", "delivery_name", "delivery_phone", "delivery_station_id") VALUES
	('1', '2023-10-01 10:00:00+00', 'pending', 'pending', '2023-10-05 10:00:00+00', 203700.00, 'Lựa giúp mình táo ngon nhé, mình cảm ơn shop', 'shipping', 'Home', '123 Main St, City, Country', 'John Doe', '123456789', NULL),
	('2', '2023-09-20 08:30:00+00', 'completed', 'success', '2023-09-25 08:30:00+00', 982900.00, 'Lựa giúp mình táo ngon nhé, mình cảm ơn shop', 'pickup', NULL, '456 Another St, City, Country', 'Station 1', NULL, '1'),
	('3', '2023-10-10 12:00:00+00', 'shipping', 'success', '2023-10-15 12:00:00+00', 450000.00, 'Lựa giúp mình táo ngon nhé, mình cảm ơn shop', 'shipping', 'Office', '789 Office St, City, Country', 'Jane Smith', '987654321', NULL),
	('4', '2023-09-15 09:00:00+00', 'completed', 'failed', '2023-09-20 09:00:00+00', 600000.00, 'Lựa giúp mình táo ngon nhé, mình cảm ơn shop', 'pickup', NULL, 'Z06, Số 13, Tân Thuận Đông, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', 'Tiệm Tí Hon - Chi nhánh 2', NULL, '2');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("id", "created_at", "name", "description", "price", "original_price", "image_url", "category_id", "stock") VALUES
	('2', '2025-06-09 08:12:40.84+00', 'Bắp cải xanh tươi - 300g', 'Bắp cải xanh tươi ngon, giàu vitamin và chất xơ, lý tưởng cho các món salad và canh rau.', 27900.00, 30000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/cabbage.png', '1', 100),
	('3', '2025-06-09 08:12:40.844+00', 'Kem sô cô la mát lạnh - 500ml', 'Kem sô cô la mịn màng với vị sô cô la đậm đà, mang lại cảm giác sảng khoái mỗi khi thưởng thức.', 313000.00, 500000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/creamy.png', '8', 100),
	('4', '2025-06-09 08:12:40.849+00', 'Bánh quy bơ Danisa - 200g', 'Bánh quy bơ giòn tan, thơm lừng hương bơ tự nhiên, hoàn hảo cho bữa trà chiều.', 150000.00, 300000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/danisa.png', '6', 100),
	('5', '2025-06-09 08:12:40.854+00', 'Chảo chống dính chuyên nghiệp', 'Chảo chống dính với lớp phủ cao cấp, giúp nấu ăn dễ dàng, tiết kiệm dầu mỡ và dễ dàng vệ sinh.', 150000.00, 300000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/pans.png', '7', 100),
	('6', '2025-06-09 08:12:40.857+00', 'Bột giặt Tide - Siêu sạch', 'Bột giặt Tide với công nghệ mạnh mẽ, loại bỏ vết bẩn ngay cả trong điều kiện khó khăn, mang lại sự tươi mới cho quần áo.', 150000.00, 300000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/tide.png', '7', 100),
	('7', '2025-06-09 08:12:40.861+00', 'Nồi cơm điện Sunhouse - 1.8L', 'Nồi cơm điện Sunhouse với thiết kế hiện đại, nấu cơm đều và tiết kiệm điện, phù hợp cho mọi gia đình.', 150000.00, 300000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/sunhouse.png', '7', 100),
	('8', '2025-06-09 08:12:40.868+00', 'Sữa tươi ít đường - 1 thùng', 'Sữa tươi ít đường với hương vị tự nhiên, bổ dưỡng và dễ tiêu, lý tưởng cho mọi lứa tuổi.', 409000.00, 420000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/milk.png', '4', 100),
	('9', '2025-06-09 08:12:40.871+00', 'Bắp cải tím hữu cơ - 1kg', 'Bắp cải tím có màu sắc bắt mắt, giàu chất chống oxy hóa, thích hợp cho mọi bữa ăn và chế biến sáng tạo.', 250000.00, 270000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/cabbage.png', '1', 100),
	('10', '2025-06-09 08:12:40.874+00', 'Kem dâu tươi ngon - 500ml', 'Kem dâu với hương vị tự nhiên từ dâu tươi, mát lạnh và thơm ngon, là lựa chọn tuyệt vời cho mùa hè.', 350000.00, 370000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/creamy.png', '8', 100),
	('11', '2025-06-09 08:12:40.877+00', 'Pudding Caramen mềm mịn - 250g', 'Pudding Caramen với lớp caramel bùi bùi, kết cấu mịn màng và hương vị khó quên, là món tráng miệng lý tưởng.', 45000.00, 50000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/creamy.png', '4', 100),
	('12', '2025-06-09 08:12:40.88+00', 'Bánh quy hạnh nhân - 150g', 'Bánh quy hạnh nhân với hương vị nhẹ nhàng của hạnh nhân rang, giòn tan và thơm ngon, phù hợp cho bữa phụ.', 15000.00, 20000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/danisa.png', '5', 100),
	('13', '2025-06-09 08:12:40.884+00', 'Sữa chua mịn màng - 200g', 'Sữa chua mịn màng với vị chua nhẹ, giàu vi khuẩn có lợi, hỗ trợ tiêu hóa và mang lại cảm giác sảng khoái.', 50000.00, 60000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/milk.png', '4', 100),
	('14', '2025-06-09 08:12:40.887+00', 'Chảo số 1 đa năng', 'Chảo đa năng với thiết kế hiện đại, chịu nhiệt tốt và bền bỉ, giúp nấu nướng trở nên dễ dàng và nhanh chóng.', 90000.00, 100000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/pans.png', '7', 100),
	('15', '2025-06-09 08:12:40.89+00', 'Kem vani ngọt ngào - 1L', 'Kem vani với hương thơm tự nhiên và vị ngọt dịu, kết cấu mịn mượt, lý tưởng cho mọi dịp thưởng thức.', 120000.00, 130000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/creamy.png', '8', 100),
	('16', '2025-06-09 08:12:40.894+00', 'Nước rửa chén Tide - Tẩy mỡ hiệu quả', 'Nước rửa chén Tide giúp làm sạch bát đĩa và dụng cụ bếp, loại bỏ dầu mỡ cứng đầu một cách dễ dàng và an toàn cho tay.', 60000.00, 70000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/tide.png', '9', 100),
	('17', '2025-06-09 08:12:40.896+00', 'Sữa đặc thơm ngọt - 1 lon', 'Sữa đặc với vị ngọt béo, lý tưởng để pha chế đồ uống hoặc làm bánh, đảm bảo chất lượng và hương vị truyền thống.', 150000.00, 160000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/milk.png', '4', 100),
	('18', '2025-06-09 08:12:40.898+00', 'Táo Granny Smith - 1kg', 'Táo Granny Smith có vị chua nhẹ, tươi mát, thích hợp cho cả ăn sống lẫn chế biến món ăn.', 20000.00, 25000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/apples.png', '1', 100),
	('19', '2025-06-09 08:12:40.902+00', 'Bắp cải mini hữu cơ - 1kg', 'Bắp cải mini có hương vị tươi mới, giàu dưỡng chất, dễ chế biến cho các món ăn nhanh và sáng tạo.', 120000.00, 130000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/cabbage.png', '1', 100),
	('20', '2025-06-09 08:12:40.905+00', 'Kem dừa thơm mát - 500ml', 'Kem dừa kết hợp vị béo ngậy của dừa tươi, mát lạnh và sảng khoái, lý tưởng cho những ngày hè nóng bức.', 180000.00, 200000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/creamy.png', '8', 100),
	('21', '2025-06-09 08:12:40.908+00', 'Bánh quy giòn ngọt - 200g', 'Bánh quy giòn với vị bơ tự nhiên và chút mật ong, mang lại hương vị nhẹ nhàng, thích hợp cho bữa sáng hay trà chiều.', 70000.00, 80000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/danisa.png', '6', 100),
	('22', '2025-06-09 08:12:40.911+00', 'Sữa chua trái cây - 250g', 'Sữa chua trái cây kết hợp vị chua thanh mát cùng mảnh vụn trái cây tươi, bổ dưỡng và thơm ngon.', 50000.00, 60000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/milk.png', '4', 100),
	('23', '2025-06-09 08:12:40.916+00', 'Chảo rán siêu bền', 'Chảo rán chất lượng cao, đảm bảo không dính và phân bố nhiệt đều, lý tưởng cho mọi món ăn từ chiên đến xào.', 90000.00, 100000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/pans.png', '7', 100),
	('24', '2025-06-09 08:12:40.928+00', 'Nồi chiên không dầu Sunhouse', 'Nồi chiên không dầu Sunhouse giúp chiên thực phẩm vàng giòn mà không cần nhiều dầu, an toàn và tiện lợi cho gia đình.', 80000.00, 90000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/sunhouse.png', '7', 100),
	('25', '2025-06-09 08:12:40.939+00', 'Nước giặt Tide - Sạch sáng', 'Nước giặt Tide với công thức độc quyền giữ cho vải vóc mềm mại, sạch sẽ và thơm mát sau mỗi lần giặt.', 150000.00, 160000.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/tide.png', '9', 100),
	('1', '2025-06-09 08:12:40.835+00', 'Táo Fuji Hảo Hạng - 1kg', 'Táo Fuji tươi ngon, giòn và ngọt tự nhiên. Được tuyển chọn kỹ càng từ những vườn cây chất lượng cao.', 67900.00, 69900.00, 'https://zalo-miniapp.github.io/zaui-market/dummy/product/apples.png', '1', 100);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('uploads', 'uploads', NULL, '2025-06-09 07:01:12.255337+00', '2025-06-09 07:01:12.255337+00', true, false, NULL, NULL, NULL);


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

-- INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") VALUES
-- 	('111620a6-a8c1-4c45-83eb-ef7e060b8da6', 'uploads', '488633989_687733233783431_902771022479772949_n.jpg', NULL, '2025-06-09 07:01:25.272939+00', '2025-06-09 07:01:25.272939+00', '2025-06-09 07:01:25.272939+00', '{"eTag": "\"990157182eafd82fcac317b7e3d7b9d5\"", "size": 29809, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-06-09T07:01:25.257Z", "contentLength": 29809, "httpStatusCode": 200}', 'ae49b735-562a-41bc-9706-021fc9440610', NULL, NULL, 1);


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
