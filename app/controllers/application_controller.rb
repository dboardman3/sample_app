class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # We put this in here to deal with the Sign In pages redirecting to the appropriate user page
                          #it is explained in chapter 9 on Michael Hartl Rails tutorial
end
