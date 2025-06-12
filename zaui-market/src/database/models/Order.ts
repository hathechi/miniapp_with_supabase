import { Database } from "../types";
import { Product } from "./Product";

export type Order = Database["public"]["Tables"]["orders"]["Row"];
export type OrderInsert = Database["public"]["Tables"]["orders"]["Insert"];
export type OrderUpdate = Database["public"]["Tables"]["orders"]["Update"];

export type OrderItem = Database["public"]["Tables"]["order_items"]["Row"];
export type OrderItemInsert =
  Database["public"]["Tables"]["order_items"]["Insert"];
export type OrderItemUpdate =
  Database["public"]["Tables"]["order_items"]["Update"];

export interface OrderWithItems extends Order {
  items: Array<
    OrderItem & {
      product: Product;
    }
  >;
}

export interface OrderDelivery {
  type: "shipping" | "pickup";
  alias?: string;
  address?: string;
  name?: string;
  phone?: string;
  id?: string;
  image?: string;
  location?: {
    lat: number;
    lng: number;
  };
}
