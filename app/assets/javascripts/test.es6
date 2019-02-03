const getWeather = (e) => {
  let weatherElem = document.querySelector('#js-weather');

  setInterval(() => {
    fetch('/weather.json?city=Poznan,pl').then((response) => {
      return response.json();
    }).then((data) => {
      weatherElem.innerHTML = 'Temperatura: ' + Math.round(data.temp_celsius);
    }).catch((err) => {
      console.log(err);
    });
  }, 10000);
}

window.addEventListener('load', getWeather)
