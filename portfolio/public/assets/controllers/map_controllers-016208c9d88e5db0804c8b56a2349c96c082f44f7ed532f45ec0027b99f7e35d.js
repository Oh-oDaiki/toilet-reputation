import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["placeholder"];
  connect() {
    import("leaflet").then((L) => {
      this.map = L.map(this.placeholderTarget).setView(
        [35.694004, 139.753632],
        10
      );
      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        maxZoom: 20,
        attribution:
          '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      }).addTo(this.map);
    });
  }

  disconnect() {
    this.map.remove();
  }
};
