import { supabase } from "../../utils/supabase";
import {
  Order,
  OrderInsert,
  OrderUpdate,
  OrderWithItems,
  OrderItem,
  OrderItemInsert,
} from "../models/Order";

export class OrderService {
  static async getAll(): Promise<Order[]> {
    const { data, error } = await supabase
      .from("orders")
      .select("*")
      .order("created_at", { ascending: false });

    if (error) throw error;
    return data || [];
  }

  static async getById(id: string): Promise<OrderWithItems | null> {
    const { data, error } = await supabase
      .from("orders")
      .select(
        `
        *,
        order_items (
          *,
          product:products (*)
        )
      `
      )
      .eq("id", id)
      .single();

    if (error) throw error;
    return data;
  }

  static async create(
    order: OrderInsert,
    items: OrderItemInsert[]
  ): Promise<OrderWithItems> {
    const { data: orderData, error: orderError } = await supabase
      .from("orders")
      .insert(order)
      .select()
      .single();

    if (orderError) throw orderError;

    const orderItems = items.map((item) => ({
      ...item,
      order_id: orderData.id,
    }));

    const { error: itemsError } = await supabase
      .from("order_items")
      .insert(orderItems);

    if (itemsError) throw itemsError;

    return this.getById(orderData.id) as Promise<OrderWithItems>;
  }

  static async update(id: string, order: OrderUpdate): Promise<Order> {
    const { data, error } = await supabase
      .from("orders")
      .update(order)
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async updateStatus(
    id: string,
    status: Order["status"]
  ): Promise<Order> {
    const { data, error } = await supabase
      .from("orders")
      .update({ status })
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async updatePaymentStatus(
    id: string,
    payment_status: Order["payment_status"]
  ): Promise<Order> {
    const { data, error } = await supabase
      .from("orders")
      .update({ payment_status })
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async getByUserId(userId: string): Promise<Order[]> {
    const { data, error } = await supabase
      .from("orders")
      .select("*")
      .eq("user_id", userId)
      .order("created_at", { ascending: false });

    if (error) throw error;
    return data || [];
  }

  static async getByStatus(status: Order["status"]): Promise<Order[]> {
    const { data, error } = await supabase
      .from("orders")
      .select("*")
      .eq("status", status)
      .order("created_at", { ascending: false });

    if (error) throw error;
    return data || [];
  }
}
