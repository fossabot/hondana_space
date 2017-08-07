import Vue from 'vue'
import Element from 'element-ui'
import VueResource from 'vue-resource'

Vue.use(Element)
Vue.use(VueResource)

document.addEventListener('DOMContentLoaded', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var element = document.getElementById("book-form")
  if (element != null) {
    var book = JSON.parse(element.dataset.book)
    const app = new Vue({
      el: element,
      data: function() {
        return {
          input: '',
          book: book
        }
      },
      methods: {
        saveCollection: function() {
          if (book.isbn == null) {
            return false
          }
          this.$http.post('/collections', { book: this.book }).then(response => {
            this.$notify({
              title: 'Collection Added',
              message: `${response.body.title}`,
              type: 'success'
            });
            this.book.isbn = null
          }, response => {
            console.log(response)
            this.$notify.error({
              title: 'Failed',
              message: `${response.bodyText}`
            });
          })
        }
      }
    })
  }
})
