ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  <% if user_signed_in? %>
     Signed in as: <strong><%= current_user.email %></strong> |
     <%= link_to 'Edit profile', edit_user_registration_path, :class => 'navbar-link' %> - <%= link_to "Sign Out", destroy_user_session_path, method: :delete, :class => 'navbar-link'  %>
   <% else %>
   # #2
     <%= link_to "Sign Up", new_user_registration_path, :class => 'navbar-link'  %> -
     <%= link_to "Sign In", new_user_session_path, :class => 'navbar-link'  %>
   <% end %>
  # Add more helper methods to be used by all tests here...
end
