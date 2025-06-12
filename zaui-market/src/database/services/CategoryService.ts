import { supabase } from "../../utils/supabase";
import { Category, CategoryInsert, CategoryUpdate } from "../models/Category";

export class CategoryService {
  static async getAll(): Promise<Category[]> {
    const { data, error } = await supabase.from("categories").select("*");

    if (error) throw error;
    return data || [];
  }

  static async getById(id: string): Promise<Category | null> {
    const { data, error } = await supabase
      .from("categories")
      .select("*")
      .eq("id", id)
      .single();

    if (error) throw error;
    return data;
  }

  static async create(category: CategoryInsert): Promise<Category> {
    const { data, error } = await supabase
      .from("categories")
      .insert(category)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async update(id: string, category: CategoryUpdate): Promise<Category> {
    const { data, error } = await supabase
      .from("categories")
      .update(category)
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async delete(id: string): Promise<void> {
    const { error } = await supabase.from("categories").delete().eq("id", id);

    if (error) throw error;
  }
}
