document.addEventListener('DOMContentLoaded', function() {
  if ( document.getElementById('item-image')) {
    const ImageList = document.getElementById('image-list')
    ImageList.setAttribute('class','image-box')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 8枚目以降は表示しない
      if (imageElementNum == 8) {
        blobImage.remove()
        inputHTML.remove()
      }

      // ファイル選択ボタンを生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', "photo")

      // 生成したHTMLの要素をブラウザに表示させる
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('item-image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    });
  }
});