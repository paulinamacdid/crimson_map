import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  static targets= ["solidHeart", "clearHeart"]
  connect() {
  }

  favourite(){
    this.clearHeartTarget.classList.add("d-none");
    this.solidHeartTarget.classList.remove("d-none");
  }

  unfavourite(){
    this.solidHeartTarget.classList.add("d-none");
    this.clearHeartTarget.classList.remove("d-none");
  }
}
