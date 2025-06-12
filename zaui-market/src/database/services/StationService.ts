import { supabase } from "../../utils/supabase";
import {
  Station,
  StationInsert,
  StationUpdate,
  StationWithLocation,
} from "../models/Station";

export class StationService {
  static async getAll(): Promise<Station[]> {
    const { data, error } = await supabase.from("stations").select("*");

    if (error) throw error;
    return data || [];
  }

  static async getById(id: string): Promise<Station | null> {
    const { data, error } = await supabase
      .from("stations")
      .select("*")
      .eq("id", id)
      .single();

    if (error) throw error;
    return data;
  }

  static async create(station: StationInsert): Promise<Station> {
    const { data, error } = await supabase
      .from("stations")
      .insert(station)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async update(id: string, station: StationUpdate): Promise<Station> {
    const { data, error } = await supabase
      .from("stations")
      .update(station)
      .eq("id", id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  static async delete(id: string): Promise<void> {
    const { error } = await supabase.from("stations").delete().eq("id", id);

    if (error) throw error;
  }

  static async getNearby(
    lat: number,
    lng: number,
    radiusKm: number = 5
  ): Promise<StationWithLocation[]> {
    const { data, error } = await supabase.rpc("nearby_stations", {
      lat,
      lng,
      radius_km: radiusKm,
    });

    if (error) throw error;
    return data || [];
  }
}
