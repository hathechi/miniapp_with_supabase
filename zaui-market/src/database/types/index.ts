export interface Database {
  public: {
    Tables: {
      products: {
        Row: {
          id: string;
          created_at: string;
          name: string;
          description: string | null;
          price: number;
          original_price: number;
          image_url: string;
          category_id: string;
          stock: number;
        };
        Insert: {
          id?: string;
          created_at?: string;
          name: string;
          description?: string | null;
          price: number;
          original_price: number;
          image_url: string;
          category_id: string;
          stock: number;
        };
        Update: {
          id?: string;
          created_at?: string;
          name?: string;
          description?: string | null;
          price?: number;
          original_price?: number;
          image_url?: string;
          category_id?: string;
          stock?: number;
        };
      };
      categories: {
        Row: {
          id: string;
          created_at: string;
          name: string;
          image_url: string;
        };
        Insert: {
          id?: string;
          created_at?: string;
          name: string;
          image_url: string;
        };
        Update: {
          id?: string;
          created_at?: string;
          name?: string;
          image_url?: string;
        };
      };
      banners: {
        Row: {
          id: string;
          created_at: string;
          image_url: string;
          order_index: number;
        };
        Insert: {
          id?: string;
          created_at?: string;
          image_url: string;
          order_index: number;
        };
        Update: {
          id?: string;
          created_at?: string;
          image_url?: string;
          order_index?: number;
        };
      };
      stations: {
        Row: {
          id: string;
          created_at: string;
          name: string;
          image_url: string;
          address: string;
          location_lat: number;
          location_lng: number;
        };
        Insert: {
          id?: string;
          created_at?: string;
          name: string;
          image_url: string;
          address: string;
          location_lat: number;
          location_lng: number;
        };
        Update: {
          id?: string;
          created_at?: string;
          name?: string;
          image_url?: string;
          address?: string;
          location_lat?: number;
          location_lng?: number;
        };
      };
      orders: {
        Row: {
          id: string;
          created_at: string;
          status: string;
          payment_status: string;
          received_at: string | null;
          total: number;
          note: string | null;
          delivery_type: string;
          delivery_alias: string | null;
          delivery_address: string | null;
          delivery_name: string | null;
          delivery_phone: string | null;
          delivery_station_id: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string;
          status: string;
          payment_status: string;
          received_at?: string | null;
          total: number;
          note?: string | null;
          delivery_type: string;
          delivery_alias?: string | null;
          delivery_address?: string | null;
          delivery_name?: string | null;
          delivery_phone?: string | null;
          delivery_station_id?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string;
          status?: string;
          payment_status?: string;
          received_at?: string | null;
          total?: number;
          note?: string | null;
          delivery_type?: string;
          delivery_alias?: string | null;
          delivery_address?: string | null;
          delivery_name?: string | null;
          delivery_phone?: string | null;
          delivery_station_id?: string | null;
        };
      };
      order_items: {
        Row: {
          id: string;
          created_at: string;
          order_id: string;
          product_id: string;
          quantity: number;
          price: number;
        };
        Insert: {
          id?: string;
          created_at?: string;
          order_id: string;
          product_id: string;
          quantity: number;
          price: number;
        };
        Update: {
          id?: string;
          created_at?: string;
          order_id?: string;
          product_id?: string;
          quantity?: number;
          price?: number;
        };
      };
    };
  };
}
