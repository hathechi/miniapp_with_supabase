-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  name TEXT NOT NULL,
  image_url TEXT NOT NULL
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  original_price DECIMAL(10,2) NOT NULL,
  image_url TEXT NOT NULL,
  category_id TEXT NOT NULL REFERENCES categories(id),
  stock INTEGER NOT NULL DEFAULT 0
);

-- Create banners table
CREATE TABLE IF NOT EXISTS banners (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  image_url TEXT NOT NULL,
  order_index INTEGER NOT NULL
);

-- Create stations table
CREATE TABLE IF NOT EXISTS stations (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  name TEXT NOT NULL,
  image_url TEXT NOT NULL,
  address TEXT NOT NULL,
  location_lat DECIMAL(10,8) NOT NULL,
  location_lng DECIMAL(11,8) NOT NULL
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  status TEXT NOT NULL,
  payment_status TEXT NOT NULL,
  received_at TIMESTAMP WITH TIME ZONE,
  total DECIMAL(10,2) NOT NULL,
  note TEXT,
  delivery_type TEXT NOT NULL,
  delivery_alias TEXT,
  delivery_address TEXT,
  delivery_name TEXT,
  delivery_phone TEXT,
  delivery_station_id TEXT REFERENCES stations(id)
);

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  order_id TEXT NOT NULL REFERENCES orders(id),
  product_id TEXT NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

-- Create indexes
CREATE INDEX IF NOT EXISTS products_category_id_idx ON products(category_id);
CREATE INDEX IF NOT EXISTS order_items_order_id_idx ON order_items(order_id);
CREATE INDEX IF NOT EXISTS order_items_product_id_idx ON order_items(product_id);
CREATE INDEX IF NOT EXISTS orders_delivery_station_id_idx ON orders(delivery_station_id); 