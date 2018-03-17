document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.querySelector('#user_password_confirmation')

  password_confirmation.addEventListener('input', equalPasswordConfirmation)
})

function equalPasswordConfirmation(password_confirmation) {
  var password = document.querySelector('#user_password')
  var password_confirmation = document.querySelector('#user_password_confirmation')

  if (password_confirmation.value == '') {
    password.classList.remove('border-success')
    password_confirmation.classList.remove('border-success')
    password.classList.remove('border-danger')
    password_confirmation.classList.remove('border-danger')
  } else if (password.value == password_confirmation.value) {
    password.classList.add('border-success')
    password_confirmation.classList.add('border-success')
    password.classList.remove('border-danger')
    password_confirmation.classList.remove('border-danger')
  } else {
    password.classList.add('border-danger')
    password_confirmation.classList.add('border-danger')
    password.classList.remove('border-success')
    password_confirmation.classList.remove('border-success')
  }
}
