require 'rack'
require 'rack/contrib/try_static'

# enable compression
use Rack::Deflater

use Rack::TryStatic,
    :root => "_site",  # static files root dir
    :urls => %w[/],     # match all requests
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

require File.expand_path('community-app/app.rb', File.dirname(__FILE__))
run CommunityApp
