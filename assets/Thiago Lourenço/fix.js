const fs = require('fs');
let html = fs.readFileSync('c:/Users/Rafael Fraga/OneDrive/Área de Trabalho/Rafael/Portfolio/Design System/index.html', 'utf8');
html = html.replace(/ crossorigin="anonymous"/g, '');
html = html.replace(/ integrity="[^"]*"/g, '');
html = html.replace('split-type_9231198fc636.es', 'split-type_9231198fc636.js');
fs.writeFileSync('c:/Users/Rafael Fraga/OneDrive/Área de Trabalho/Rafael/Portfolio/Design System/index1.html', html, 'utf8');
