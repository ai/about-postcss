#= require shower-core/shower.min

for link in document.querySelectorAll('a')
  link.target = '_blank' if link.attributes.href.value.match(/^http/)

progress = document.querySelector('.progress')
progressForCovers = ->
  if document.querySelector('.slide.active.cover')
    progress.classList.add('for-cover')
  else
    progress.classList.remove('for-cover')

window.addEventListener('hashchange', progressForCovers)
setTimeout(progressForCovers, 100)
