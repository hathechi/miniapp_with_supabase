// File: supabase/functions/get-zalo-info/index.ts

import { serve } from "https://deno.land/std@0.177.0/http/server.ts";

const ZALO_API_ENDPOINT = "https://graph.zalo.me/v2.0/me/info";
const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "apikey, content-type",
};

// Lấy Zalo Secret Key từ "két sắt" Supabase Secrets
// const ZALO_SECRET_KEY = Deno.env.get("ZALO_APP_SECRET_KEY");
const ZALO_SECRET_KEY = "JX2DFLtGmx62Jwt6PFl3";

console.log("ZALO_SECRET_KEY", ZALO_SECRET_KEY);

serve(async (req) => {
  // Xử lý CORS Preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: CORS_HEADERS });
  }

  // "Tổng đài" chỉ nhận cuộc gọi POST thôi nhé
  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Làm ơn dùng method POST" }), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      status: 405, // Method Not Allowed
    });
  }

  try {
    // Lấy hết "giấy tờ" mà client gửi lên trong body
    const body = await req.json();
    const { userAccessToken, token } = body;

    // Kiểm tra xem client có đưa đủ giấy tờ không
    if (!userAccessToken || !token || !ZALO_SECRET_KEY) {
      throw new Error(
        "Thiếu `userAccessToken`, `token` trong body, hoặc server chưa set ZALO_APP_SECRET_KEY!"
      );
    }

    console.log("Tổng đài đã nhận đủ giấy tờ, chuẩn bị gọi cho Zalo...");

    // Tổng đài cầm giấy tờ đi gọi Zalo
    const zaloResponse = await fetch(ZALO_API_ENDPOINT, {
      method: "GET",
      headers: {
        access_token: userAccessToken,
        code: token,
        secret_key: ZALO_SECRET_KEY, // Cái này lấy từ server, tuyệt đối an toàn
      },
    });

    // Lấy kết quả từ Zalo
    const zaloData = await zaloResponse.json();
    console.log("zaloData", zaloData);
    // Nếu Zalo chửi thì tổng đài chửi lại y chang cho client nghe
    if (!zaloResponse.ok) {
      console.error("Zalo API báo lỗi:", zaloData);
      return new Response(JSON.stringify(zaloData), {
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        status: zaloResponse.status, // Trả về status lỗi của Zalo luôn
      });
    }

    // Nếu Zalo ok thì trả "hàng" về cho client
    return new Response(JSON.stringify(zaloData), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      status: 200,
    });
  } catch (error) {
    console.error("Lỗi khi gọi Zalo:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      status: 400, // Bad Request (vd: client gửi JSON sai cú pháp)
    });
  }
});
