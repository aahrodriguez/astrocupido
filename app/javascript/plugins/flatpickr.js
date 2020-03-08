import flatpickr from "flatpickr";

document.addEventListener("DOMContentLoaded", () => {
  flatpickr(".datepicker", {enableTime: true, dateFormat: "d-m-Y H:i"});
})
