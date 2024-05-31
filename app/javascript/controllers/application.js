import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('turbo:load', () => {
  const calendarIcons = document.querySelectorAll('.fa-regular.fa-calendar');
  calendarIcons.forEach((icon) => {
    icon.addEventListener('click', (event) => {
      const target = event.target.dataset.target;
      const input = document.getElementById(target);
      input.focus();
    });
  });
});


