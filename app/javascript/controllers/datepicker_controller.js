export default class extends Controller {
  connect() {
    const bookedDates = this.getBookedDates();
    flatpickr(this.element, {
      minDate: "today",
      enableTime: false,
      dateFormat: "Y-m-d",
      disable: bookedDates.map(date => ({ from: date.from, to: date.to }))
    });
  }
  getBookedDates() {
    const bookingForm = this.element.closest("#booking-form");
    return JSON.parse(bookingForm.dataset.bookingsDates);
  }
}
