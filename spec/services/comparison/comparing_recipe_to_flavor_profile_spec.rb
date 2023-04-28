require 'rails_helper'

RSpec.describe Comparison::ComparingRecipeToFlavorProfile do
  let(:flavor_profile) { create(:flavor_profile, saltiness: 0.3, bitterness: 0.3, savoriness: 0.3, sourness: 0.3, spiciness: 0.3, sweetness: 0.3, fattiness: 0.3) }
  let(:recipe) { create(:recipe) }
  subject { described_class.new(flavor_profile, recipe) }

  describe '#perform' do
    context 'when all keys are present' do
      before do
        @initial_flavor_profile = flavor_profile.attributes
        @initial_flavor_profile.delete('id')
        @initial_flavor_profile.delete('created_at')
        @initial_flavor_profile.delete('updated_at')

        @initial_recipe = recipe.attributes
        @initial_recipe.delete('id')
        @initial_recipe.delete('created_at')
        @initial_recipe.delete('updated_at')
      end

      it 'decreases the grade of each key in the flavor profile' do
        subject.perform

        keys = ['saltiness', 'bitterness', 'savoriness', 'sourness', 'spiciness', 'sweetness', 'fattiness']
        keys.each do |key|
          initial_value = @initial_flavor_profile[key]
          updated_value = flavor_profile.reload[key]

          expect(updated_value).to be < initial_value
        end
      end

      it 'saves the updated flavor profile' do
        subject.perform

        expect(flavor_profile.reload).not_to eq(@initial_flavor_profile)
      end
    end
  end
end
