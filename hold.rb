<header class="page-header">
    <h1>Signup</h1>
  </header>

<%= form_for :user, url: '/users' do |f| %>

  First Name <%= f.text_field :first_name %>
  Last Name <%= f.text_field :last_name %>
  Email: <%= f.text_field :email %>
  Password: <%= f.password_field :password %>
  Password Confirmation: <%= f.password_field :password_confirmation %>
  <%= f.submit "Submit" %>

<% end %>