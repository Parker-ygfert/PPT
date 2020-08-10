import { Controller } from "stimulus";
import Rails from "@rails/ujs";
// import axios from "axios";

export default class extends Controller {
  static targets = ["heart"];

  //* 確認 controller 是否有掛載上去
  // connect() {
  //   console.log("hi");
  // }


  favorite() {
    const event = new CustomEvent("cat", {
      detail: {
        hazcheeseburger: true
      }
    });
    window.dispatchEvent(event);
    
    
    
    // console.log("go!");   
    let boardId = this.data.get("board");

    Rails.ajax({
      url: `/boards/${boardId}/favorite.json`,
      type: "post",
      success: (result) => {
        if (result["status"] === true) {
          this.heartTarget.classList.add("fas");
          this.heartTarget.classList.remove("far");
        } else {
          this.heartTarget.classList.add("far");
          this.heartTarget.classList.remove("fas");
        }
      },
      error: (error) => {
        console.log(error);
      }
    });
    
    //* axios 的用法
    // const token = document.querySelector("meta[name=csrf-token]").content;
    // axios.defaults.headers.common["X-CSRF-Token"] = token;
    
    // axios.post(`/boards/${boardId}/favorite.json`)
    //      .then((result) => {
    //        if (result.data["status"] === true) {
    //          console.log(result.data["status"]);
    //          this.heartTarget.classList.add("fas");
    //          this.heartTarget.classList.remove("far");
    //        } else {
    //          console.log(result.data["status"]);
    //          this.heartTarget.classList.add("far");
    //          this.heartTarget.classList.remove("fas");
    //        }
    //      })
    //      .catch(function(error) {
    //        console.log(error);
    //      });
  }
}
