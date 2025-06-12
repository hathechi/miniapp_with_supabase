import { Database } from "../types";

export type Station = Database["public"]["Tables"]["stations"]["Row"];
export type StationInsert = Database["public"]["Tables"]["stations"]["Insert"];
export type StationUpdate = Database["public"]["Tables"]["stations"]["Update"];

export interface StationWithLocation extends Station {
  location: {
    lat: number;
    lng: number;
  };
}
