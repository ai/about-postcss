#= require shower-core/shower.min

for link in document.querySelectorAll('a')
  link.target = '_blank' if link.attributes.href.value.match(/^http/)
