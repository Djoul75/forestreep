import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#booking_start_date", {
    altInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#booking_end_date"})]
  });
}

export { initFlatpickr };
