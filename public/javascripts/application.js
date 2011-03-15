function updateThumb(id, name) {
  $('#thumbnail_' + id).attr('src', 'http://thumbnail.api.livestream.com/thumbnail?name=' + name + '&t=' + new Date().valueOf());
}

