// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
Turbo:session.drive = false;
import * as bootstrap from "bootstrap"
import "popper"
window.bootstrap = bootstrap