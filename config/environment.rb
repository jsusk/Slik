# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Slik::Application.initialize!

#Traducciones
I18n.default_locale = :es
