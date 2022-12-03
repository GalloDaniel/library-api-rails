require 'swagger_helper'

RSpec.describe 'authors', type: :request do

  path '/authors' do

    get('list authors') do
      response(200, 'successful') do

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

    post('create author') do
      consumes "application/json"
      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          main_gender: { type: :string },
          age: { type: :string }
        }
      }
      response(201, 'created') do
        let(:author) {{
          name: "Daniel",
          main_gender: "comedy",
          age: "30"
         }}
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(422, 'unprocessable entity') do
        let(:author) { {
          name: "dasda",
          main_gender: "diasjdad"
          } }

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

  path '/authors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show author') do
      response(200, 'successful') do
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'Not Found') do
        let(:id) { '21312' }

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

    patch('update author') do
      consumes "application/json"
      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          main_gender: { type: :string },
          age: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { '1' }
        let(:author) {{
          name: "Daniel",
          main_gender: "comedy",
          age: "30"
         }}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'Not Found') do
        let(:id) { '21312' }

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

    put('update author') do
      consumes "application/json"
      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          main_gender: { type: :string },
          age: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { '1' }
        let(:author) {{
          name: "Daniel",
          main_gender: "comedy",
          age: "30"
         }}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'Not Found') do
        let(:id) { '21312' }

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

    delete('delete author') do
      response(200, 'successful') do
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'Not Found') do
        let(:id) { '21312' }

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
