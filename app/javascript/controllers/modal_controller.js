import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Add event listener for ESC key
    document.addEventListener('keydown', this.handleKeydown.bind(this))
  }

  disconnect() {
    // Remove event listener when controller is disconnected
    document.removeEventListener('keydown', this.handleKeydown.bind(this))
  }

  open() {
    this.element.classList.remove('hidden')
    this.element.classList.add('flex')
  }

  close() {
    this.element.classList.remove('flex')
    this.element.classList.add('hidden')
  }

  handleKeydown(event) {
    if (event.key === 'Escape') {
      this.close()
    }
  }
} 