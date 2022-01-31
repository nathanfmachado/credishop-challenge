
jQuery(function() {
  const requestInssDiscountCalculation = (salary) => {
    let actionUrl = `calculate_inss_discount?salary=${salary}`;
  
    fetch(actionUrl, {
      method: 'GET',
      headers: {
        'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type':     'application/json',
        'Accept':           'application/json'
      },
      credentials: 'same-origin'
    }).then((response) => {
      if (response.status >= 200 && response.status < 300) {
        response.json().then((response) => {
          $('#proponent_inss_discount').val(response.inss_discount);
        });
      }
    }).catch((err) => console.log(err));
  }
  
  $('#proponent_salary').on('blur',
    () => requestInssDiscountCalculation($('#proponent_salary').val())
  );
  
  $('form').on('submit', () => {
    $('#proponent_inss_discount').prop( "disabled", false );
  });
});