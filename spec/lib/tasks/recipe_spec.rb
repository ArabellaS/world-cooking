require 'rails_helper'
require 'rake'

RSpec.describe "recipes:update task" do
  before do
    FactoryBot.create_list(:recipe, 3)
  end

  it "enqueues an UpgradeRecipeRatingsJob for each recipe" do
    # Vérifier si la tâche a été chargée
    unless Rake::Task.task_defined?('recipes:update')
      # Si elle n'a pas été chargée, la charger
      load File.expand_path('../../../../lib/tasks/recipes.rake', __FILE__)
    end
    # Appeler la tâche
    Rake::Task['recipes:update'].invoke

    expect(UpgradeRecipeRatingsJob).to have_been_enqueued.exactly(3).times
  end
end
