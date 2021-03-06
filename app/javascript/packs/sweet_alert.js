import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

initSweetalert('#sweet-alert-demo', {
  title: "Payment Confirmed",
  text: "Enjoy your Crib",
  icon: "success"
});

// const
// const a = document.querySelector("#sweet-alert-demo");
// a.addEventListener("click", (event) => {
//   booking.
// });
