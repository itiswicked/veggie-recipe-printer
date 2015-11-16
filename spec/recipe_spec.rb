require_relative 'spec_helper'

describe Recipe do
  let(:data) {
    {
      name: "Roasted Brussels Sprouts",
      ingredients: [
        "1 1/2 pounds Brussels sprouts",
        "3 tablespoons good olive oil",
        "3/4 teaspoon kosher salt",
        "1/2 teaspoon freshly ground black pepper"
      ],
      directions: [
        "Preheat oven to 400 degrees F.",
        "Cut off the brown ends of the Brussels sprouts.",
        "Pull off any yellow outer leaves.",
        "Mix them in a bowl with the olive oil, salt and pepper.",
        "Pour them on a sheet pan and roast for 35 to 40 minutes.",
        "They should be until crisp on the outside and tender on the inside.",
        "Shake the pan from time to time to brown the sprouts evenly.",
        "Sprinkle with more kosher salt ( I like these salty like French fries).",
        "Serve and enjoy!"
      ]
    }
  }

  let(:recipe) { Recipe.new(data) }

  describe '#initialize' do
    it 'accepts a hash as an argument' do
      expect(recipe.data).to be_a(Hash)
    end

    it 'does not have a writeable attribute data' do
      expect { recipe.data = 'something not as tasty' }
        .to raise_error(NoMethodError)
    end
  end

  describe '#erb_template' do
    it "returns a string" do
      expect(recipe.erb_template).to be_a(String)
    end

    it 'returns a string with embedded ruby' do
      ["<%=", "<%", "%>"]
        .each { |erb_tag| expect(recipe.erb_template).to include(erb_tag) }
    end
  end

  describe '#render' do

    it 'returns a recipe name, ingredients, and directions' do
      expect(recipe.render).to include(data[:name])
      expect(recipe.render).to include(data[:ingredients].first)
      expect(recipe.render).to include(data[:ingredients].last)
      expect(recipe.render).to include(data[:directions].first)
      expect(recipe.render).to include(data[:directions].last)
    end

  end
end
