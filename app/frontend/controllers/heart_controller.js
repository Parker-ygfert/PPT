import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["heart"];

  //* 確認 controller 是否有掛載上去
  // connect() {
  //   console.log("hi");
  // }


  favorite() {
    this.heartTarget.classList.toggle("far");
    this.heartTarget.classList.toggle("fas");
    // console.log("go!");
  }
}
