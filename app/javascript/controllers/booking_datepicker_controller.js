import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const bookedDates = this.getBookedDates();
    const pricePerDay = this.getPricePerDay();

    const flatpickrInstance = flatpickr(this.element, {
      inline: true,
      mode: 'range',
      minDate: "today",
      enableTime: false,
      dateFormat: "Y-m-d",
      disable: bookedDates.map(date => ({ from: date.from, to: date.to })),
      onChange: (selectedDates, dateStr, instance) => {
        this.updateTotalPrice(selectedDates, pricePerDay);
      }
    });
  }

  getBookedDates() {
    const bookingForm = this.element.closest("#booking-form");
    return JSON.parse(bookingForm.dataset.bookingsDates);
  }
  getPricePerDay(){
    const bookingForm = this.element.closest("#booking-form")
    return parseFloat(bookingForm.dataset.pricePerDay)
  }

  updateTotalPrice(selectedDates, pricePerDay) {
    const startDate = selectedDates[0];
    const endDate = selectedDates[selectedDates.length - 1];
    const totalDays = this.getDateDiff(startDate, endDate) + 1;
    const totalPrice = totalDays * pricePerDay;
    const totalPriceElement = document.getElementById('total-price');
    totalPriceElement.textContent = `$${totalPrice}`;
  }

  getDateDiff(startDate, endDate) {
    const oneDay = 24 * 60 * 60 * 1000;
    const diffMilliseconds = Math.abs(endDate - startDate);
    return parseInt(Math.round(diffMilliseconds / oneDay));
  }
}
