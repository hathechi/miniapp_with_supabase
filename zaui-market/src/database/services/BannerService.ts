import { supabase } from "../../utils/supabase";
import { Banner, BannerInsert, BannerUpdate } from "../models/Banner";

export class BannerService {
  static async getAll(): Promise<Banner[]> {
    const { data, error } = await supabase
      .from("banners")
      .select("*")
      .order("order_index", { ascending: true });

    if (error) throw error;
    return data || [];
  }

  static async getById(id: string): Promise<Banner | null> {
    const { data, error } = await supabase
      .from("banners")
      .select("*")
      .eq("id", id)
      .single();

    if (error) throw error;
    return data;
  }

  static async create(banner: BannerInsert): Promise<Banner> {
    const { data, error } = await supabase
      .from("banners")
      .insert(banner)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async update(id: string, banner: BannerUpdate): Promise<Banner> {
    const { data, error } = await supabase
      .from("banners")
      .update(banner)
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async delete(id: string): Promise<void> {
    const { error } = await supabase.from("banners").delete().eq("id", id);

    if (error) throw error;
  }
}
