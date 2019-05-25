import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "fileInput", "preview", "fileName", "realInput" ]

  connect() {
  }

  openBrowse() {
    this.realInputTarget.click()
  }

  afterUpload() {
    const files = this.realInputTarget.files

    // Assign file to real input
    // const realInput = this.realInputTarget
    // realInput.files = files

    // Refresh filename
    // const label = this.fileNameTarget
    // label.innerText = files[0].name

    // Refresh image
    const uploadedImg = files[0]
    const previewImg = this.previewTarget
    const newUrl = window.URL.createObjectURL(uploadedImg)
    previewImg.src = newUrl
  }
}
