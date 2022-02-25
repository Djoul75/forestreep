import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["totalprice"]

  totalPrice() {
    let dates = document.getElementById("booking_start_date").value;
    dates = dates.replace("to", "").split(/[ ,]+/);
    const startDate = Date.parse(dates[0]);
    const endDate = Date.parse(dates[1]);
    const duration = (endDate - startDate) / 86400000;

    const price = document.getElementById("price").innerHTML

    const totalPrice = duration * price

    this.totalpriceTarget.innerHTML = totalPrice
  }
}
