import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "total"]
  static values = { pricePerNight: Number }

  connect() {
    this.updatePrice()
  }

  updatePrice() {
    const start = new Date(this.startDateTarget.value)
    const end = new Date(this.endDateTarget.value)

    if (!isNaN(start) && !isNaN(end)) {
      const nights = Math.max(0, (end - start) / (1000 * 60 * 60 * 24))
      const total = nights * this.pricePerNightValue
      this.totalTarget.textContent = total.toLocaleString("fr-FR", {
        style: "currency",
        currency: "EUR",
      })
    } else {
      this.totalTarget.textContent = "0 €"
    }
  }
}
