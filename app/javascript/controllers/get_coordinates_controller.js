import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="get-coordinates"
export default class extends Controller {
  static values = {
    user: Number
  }

  connect() {
      this.options = {
        enableHighAccuracy: false,
        timeout: 5000,
        maximumAge: 0,
      };
        navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, this.options)
      }

      success(pos) {
        // this function is triggered when current position is successfully called
        console.log("start lat", pos.coords.latitude);
        console.log("start long", pos.coords.longitude);
        // update the user with the coordinate positions
            let formData = new FormData();
        formData.append('current_lat', pos.coords.latitude);
        formData.append('current_long', pos.coords.longitude);
        const csrf = document.querySelector('meta[name="csrf-token"]').content
        fetch(`/users/${this.userValue}`,{
          method:"PATCH",
          headers: { "Accept": "application/json", "X-CSRF-Token": csrf },
          body: formData
        })
      }
}
