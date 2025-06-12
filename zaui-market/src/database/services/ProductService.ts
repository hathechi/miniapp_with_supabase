import { supabase } from "../../utils/supabase";
import {
  Product,
  ProductInsert,
  ProductUpdate,
  ProductWithCategory,
} from "../models/Product";

export class ProductService {
  static async getAll(): Promise<ProductWithCategory[]> {
    const { data, error } = await supabase.from("products").select(`
        *,
        category:categories(id, name)
      `);

    if (error) throw error;
    return data || [];
  }

  static async getById(id: string): Promise<ProductWithCategory | null> {
    const { data, error } = await supabase
      .from("products")
      .select(
        `
        *,
        category:categories(id, name)
      `
      )
      .eq("id", id)
      .single();

    if (error) throw error;
    return data;
  }

  static async create(product: ProductInsert): Promise<Product> {
    const { data, error } = await supabase
      .from("products")
      .insert(product)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async update(id: string, product: ProductUpdate): Promise<Product> {
    const { data, error } = await supabase
      .from("products")
      .update(product)
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async delete(id: string): Promise<void> {
    const { error } = await supabase.from("products").delete().eq("id", id);

    if (error) throw error;
  }

  static async getByCategory(
    categoryId: string
  ): Promise<ProductWithCategory[]> {
    const { data, error } = await supabase
      .from("products")
      .select(
        `
        *,
        category:categories(id, name)
      `
      )
      .eq("category_id", categoryId);

    if (error) throw error;
    return data || [];
  }
}
