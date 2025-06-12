import Carousel from "@/components/carousel";
import { useAtomValue } from "jotai";
import { bannersState } from "@/state";

export default function Banners() {
  const banners = useAtomValue(bannersState) || [];

  return (
    <Carousel
      slides={banners.map((banner) => (
        <img
          key={banner.id}
          className="w-full rounded"
          src={banner.image_url}
          alt={banner.id}
        />
      ))}
    />
  );
}
