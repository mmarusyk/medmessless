# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('Retrieves a list of doctors') do
      tags 'Doctors'
      produces 'application/json'

      response(200, 'OK') do
        schema(
          type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              first_name: { type: :string },
              last_name: { type: :string },
              email: { type: :string },
              category: { type: :string }
            }
          }
        )

        before { create_list(:doctor, 2) }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
