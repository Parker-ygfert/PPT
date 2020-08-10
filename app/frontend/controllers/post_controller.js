import { Controller } from "stimulus";
import Rails from "@rails/ujs";
// import axios from "axios";

export default class extends Controller {
  static targets = ["title"];

  something(event) {
    this.titleTarget.textContent = "";
    console.log(event);
  }
}
