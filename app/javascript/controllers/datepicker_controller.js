import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const startDateInput = document.getElementById('booking_start_date');
    const endDateInput = document.getElementById('booking_end_date');

    flatpickr(startDateInput, {
      dateFormat: 'd-m-Y',
      minDate: 'today',
      theme: 'light',
      onClose: function(selectedDates) {
        endDateCalendar.set('minDate', selectedDates[0] || null);
        validateDates(startDateInput, endDateInput);
      }
    });

    const endDateCalendar = flatpickr(endDateInput, {
      dateFormat: 'd-m-Y',
      theme: 'light',
      onClose: function(selectedDates) {
        validateDates(startDateInput, endDateInput);
      }
    });

    function validateDates(startInput, endInput) {
      const startDate = startInput.value ? new Date(startInput.value) : null;
      const endDate = endInput.value ? new Date(endInput.value) : null;

      if (startDate && endDate && endDate < startDate) {
        endInput.value = "";
        endInput.classList.add('is-invalid');
      } else {
        endInput.classList.remove('is-invalid');
      }
    }
  }
}
