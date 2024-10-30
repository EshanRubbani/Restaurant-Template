window.sendEmail = function (name, people, date, phone, email) {
    // emailjs.init("ZdcanJgdgoeGhWosX");
    // var templateParams = {
    //   name: name,
    //   people: people,
    //   date: date,
    //   phone: phone,
    //   email: email
    // };
    emailjs.init({
      publicKey: 'ZdcanJgdgoeGhWosX',
      // Do not allow headless browsers
      blockHeadless: true,
     
      limitRate: {
        // Set the limit rate for the application
        id: 'app',
        // Allow 1 request per 10s
        throttle: 10000,
      },
    });
  
    // emailjs.send('service_tt5aorl', 'Reservation', templateParams)
    //   .then(function (response) {
    //     console.log('SUCCESS!', response.status, response.text);
    //   }, function (error) {
    //     console.log('FAILED...', error);
    //   });
    var templateParams = {
       name: name,
      people: people,
      date: date,
      phone: phone,
      email: email
    };
    
    emailjs.send('service_tt5aorl', 'Reservation', templateParams).then(
      (response) => {
        console.log('SUCCESS!', response.status, response.text);
      },
      (error) => {
        console.log('FAILED...', error);
      },
    );
  //     emailjs.send('service_tt5aorl', 'Reservation', templateParams)
  // .then(function(response) {
  //   console.log('SUCCESS!', response.status, response.text);
  // }, function(error) {
  //   console.log('FAILED...', error);  // Log error details
  //   console.log('Error status:', error.status);
  //   console.log('Error message:', error.text);
  // });

  }
  
  

  window.sendMessage = function (name,email,message) {
    // emailjs.init("ZdcanJgdgoeGhWosX");
    // var templateParams = {
    //   name: name,
    //   people: people,
    //   date: date,
    //   phone: phone,
    //   email: email
    // };
    emailjs.init({
      publicKey: 'ZdcanJgdgoeGhWosX',
      // Do not allow headless browsers
      blockHeadless: true,
     
      limitRate: {
        // Set the limit rate for the application
        id: 'app',
        // Allow 1 request per 10s
        throttle: 10000,
      },
    });
  
    // emailjs.send('service_tt5aorl', 'Reservation', templateParams)
    //   .then(function (response) {
    //     console.log('SUCCESS!', response.status, response.text);
    //   }, function (error) {
    //     console.log('FAILED...', error);
    //   });
    var templateParams = {
       name: name,
      email: email,
      message: message
    };
    
    emailjs.send('service_tt5aorl', 'Message', templateParams).then(
      (response) => {
        console.log('SUCCESS!', response.status, response.text);
      },
      (error) => {
        console.log('FAILED...', error);
      },
    );
  //     emailjs.send('service_tt5aorl', 'Reservation', templateParams)
  // .then(function(response) {
  //   console.log('SUCCESS!', response.status, response.text);
  // }, function(error) {
  //   console.log('FAILED...', error);  // Log error details
  //   console.log('Error status:', error.status);
  //   console.log('Error message:', error.text);
  // });

  }
  