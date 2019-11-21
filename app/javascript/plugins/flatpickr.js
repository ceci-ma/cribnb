import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
require("flatpickr/dist/themes/material_green.css");

flatpickr("#range_start", {
  plugins: [new rangePlugin({ input: "#range_end"})],
  altInput: true
})
