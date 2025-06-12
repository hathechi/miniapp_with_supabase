import { Database } from "../types";

export type Product = Database["public"]["Tables"]["products"]["Row"];
export type ProductInsert = Database["public"]["Tables"]["products"]["Insert"];
export type ProductUpdate = Database["public"]["Tables"]["products"]["Update"];

export interface ProductWithCategory extends Product {
  category?: {
    id: string;
    name: string;
  };
}
