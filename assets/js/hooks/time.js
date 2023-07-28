export const register = () => {
  window.addEventListener("phx:time_tick", (e) =>
    (document.getElementById("time-wrapper").innerHTML = new Date(
      e.detail.time
    )).toUTCString()
  );
};
