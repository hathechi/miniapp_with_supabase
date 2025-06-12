const { createClient } = require("@supabase/supabase-js");
const products = require("../../mock/products.json");
const categories = require("../../mock/categories.json");
const banners = require("../../mock/banners.json");
const stations = require("../../mock/stations.json");
const orders = require("../../mock/orders.json");

const supabaseUrl = "http://127.0.0.1:54321";
const supabaseAnonKey =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0";

const supabase = createClient(supabaseUrl, supabaseAnonKey);

async function importData() {
  try {
    // Import categories
    console.log("Importing categories...");
    for (const category of categories) {
      const { error } = await supabase.from("categories").upsert({
        id: category.id.toString(),
        name: category.name,
        image_url: category.image,
        created_at: new Date().toISOString(),
      });

      if (error) {
        console.error("Error importing category:", category.name, error);
      }
    }
    console.log("Categories imported successfully!");

    // Import products
    console.log("Importing products...");
    for (const product of products) {
      const { error } = await supabase.from("products").upsert({
        id: product.id.toString(),
        name: product.name,
        description: product.detail,
        price: product.price,
        original_price: product.originalPrice,
        image_url: product.image,
        category_id: product.categoryId.toString(),
        stock: 100, // Default stock
        created_at: new Date().toISOString(),
      });

      if (error) {
        console.error("Error importing product:", product.name, error);
      }
    }
    console.log("Products imported successfully!");

    // Import banners
    console.log("Importing banners...");
    for (let i = 0; i < banners.length; i++) {
      const { error } = await supabase.from("banners").upsert({
        id: (i + 1).toString(),
        image_url: banners[i],
        order_index: i,
        created_at: new Date().toISOString(),
      });

      if (error) {
        console.error("Error importing banner:", i + 1, error);
      }
    }
    console.log("Banners imported successfully!");

    // Import stations
    console.log("Importing stations...");
    for (const station of stations) {
      const { error } = await supabase.from("stations").upsert({
        id: station.id.toString(),
        name: station.name,
        image_url: station.image,
        address: station.address,
        location_lat: station.location.lat,
        location_lng: station.location.lng,
        created_at: new Date().toISOString(),
      });

      if (error) {
        console.error("Error importing station:", station.name, error);
      }
    }
    console.log("Stations imported successfully!");

    // Import orders and order items
    console.log("Importing orders...");
    for (const order of orders) {
      // Import order
      const { error: orderError } = await supabase.from("orders").upsert({
        id: order.id.toString(),
        status: order.status,
        payment_status: order.paymentStatus,
        created_at: order.createdAt,
        received_at: order.receivedAt,
        total: order.total,
        note: order.note,
        delivery_type: order.delivery.type,
        delivery_alias: order.delivery.alias,
        delivery_address: order.delivery.address,
        delivery_name: order.delivery.name,
        delivery_phone: order.delivery.phone,
        delivery_station_id: order.delivery.id?.toString(),
      });

      if (orderError) {
        console.error("Error importing order:", order.id, orderError);
        continue;
      }

      // Import order items
      for (const item of order.items) {
        const { error: itemError } = await supabase.from("order_items").upsert({
          order_id: order.id.toString(),
          product_id: item.product.id.toString(),
          quantity: item.quantity,
          price: item.product.price,
          created_at: new Date().toISOString(),
        });

        if (itemError) {
          console.error(
            "Error importing order item:",
            order.id,
            item.product.id,
            itemError
          );
        }
      }
    }
    console.log("Orders imported successfully!");
  } catch (error) {
    console.error("Error importing data:", error);
  }
}

// Run the import
importData();
