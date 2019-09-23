// Refresh grafana every minute to renew azure ad proxy tokens
let refreshgrafana = () => {
  let refreshgrafanaframe = document.getElementById("refreshgrafana");
  console.log("grafana frame", refreshgrafanaframe);
  let ts = new Date().getTime(); // Just something that will change over time.
  let url = "https://grafana.adeo.no/" + '?forceCacheRefreshTs=' + ts;
  refreshgrafanaframe.src = url;
  console.log("grafana url", url);
};
refreshgrafana();
setInterval(refreshgrafana, 1000 * 60 * 1);

// Check if screenMap has changed every minute and update iframe src
let setUrlForHostname = (hostname, screenMapUrl, grafana) => {
  return fetch(unescape(screenMapUrl), {
    method: 'get'
  }).then(response => {
    return response.json();
  }).then(response => {
    console.log("screenMap: ", response);
    if (grafana.src !== response[hostname]) {
      grafana.src = response[hostname];
    }
  }).catch(err => {
    console.log(err);
  });
};

let hostnameRegex = new RegExp("[?&]hostname=([^&]+)");
let hostname = hostnameRegex.exec(window.location.href)[1];

let screenMapUrlRegex = new RegExp("[?&]screenMapUrl=([^&]+)");
let screenMapUrl = screenMapUrlRegex.exec(window.location.href)[1];

let grafanaFrame = document.getElementById("grafana");

console.log("hostname: ", hostname);
console.log("screenMapUrl: ", screenMapUrl);

setUrlForHostname(hostname, screenMapUrl, grafanaFrame);
setInterval(setUrlForHostname, 1000 * 60 * 1, hostname, screenMapUrl, grafanaFrame);
