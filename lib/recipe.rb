require 'erb'

class Recipe
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def render
    ERB.new(erb_template).result(binding)
  end

  def erb_template
    <<-RECIPE
 *<%= '=' * name_length %>*
      * Recipe: <%= data[:name] %> *
      *<%= '=' * name_length %>*

      Ingredients
      -----------
      <% data[:ingredients].each do |ingredient| %>
        <%= ingredient %>
      <% end %>

      Directions
      ----------
      <% data[:directions].each_with_index do |direction, i| %>
        <%= i + 1 %>. <%= direction %>
      <% end %>
    RECIPE
  end

  private

    def name_length
      " Recipe: #{data[:name]} ".length
    end

end
