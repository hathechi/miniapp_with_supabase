import { getConfig } from "./template";
import { supabase } from "../database/utils/supabase";

const API_URL = getConfig((config) => config.template.apiUrl);

const mockUrls = import.meta.glob<{ default: string }>("../mock/*.json", {
  query: "url",
  eager: true,
});

export async function request<T>(
  path: string,
  options?: RequestInit
): Promise<T> {
  const tableMatch = path.match(/^\/([^\/]+)(?:\/([^\/]+))?$/);
  if (tableMatch) {
    const [, table, id] = tableMatch;
    try {
      if (id) {
        const { data, error } = await supabase
          .from(table)
          .select("*")
          .eq("id", id)
          .single();

        if (error) throw error;
        return data as T;
      } else {
        const { data, error } = await supabase.from(table).select("*");
        if (error) throw error;
        return data as T;
      }
    } catch (error) {
      console.error("Supabase request failed:", error);
      const url = mockUrls[`../mock${path}.json`]?.default;
      if (url) {
        await new Promise((resolve) => setTimeout(resolve, 500));
        const response = await fetch(url, options);
        return response.json() as T;
      }
      throw error;
    }
  }

  const url = API_URL
    ? `${API_URL}${path}`
    : mockUrls[`../mock${path}.json`]?.default;

  if (!API_URL) {
    await new Promise((resolve) => setTimeout(resolve, 500));
  }
  const response = await fetch(url, options);
  return response.json() as T;
}

export async function requestWithFallback<T>(
  path: string,
  fallbackValue: T
): Promise<T> {
  try {
    return await request<T>(path);
  } catch (error) {
    console.warn(
      "An error occurred while fetching data. Falling back to default value!"
    );
    console.warn({ path, error, fallbackValue });
    return fallbackValue;
  }
}

export async function requestWithPost<P, T>(
  path: string,
  payload: P
): Promise<T> {
  const tableMatch = path.match(/^\/([^\/]+)$/);
  if (tableMatch) {
    const [, table] = tableMatch;
    try {
      const { data, error } = await supabase
        .from(table)
        .insert(payload)
        .select()
        .single();

      if (error) throw error;
      return data as T;
    } catch (error) {
      console.error("Supabase insert failed:", error);
      return await request<T>(path, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(payload),
      });
    }
  }

  return await request<T>(path, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(payload),
  });
}
