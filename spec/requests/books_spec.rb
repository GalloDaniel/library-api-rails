require 'swagger_helper'

RSpec.describe 'books', type: :request do

  path '/books' do

    get('list books') do
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

    post('create book') do
      consumes "application/json"
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          gender: { type: :string },
          author_id: { type: :integer },
          publish_date: { type: :datetime },
          publishing_company: { type: :string }
        }
      }
      response(201, 'created') do
        let(:book) { {
          title: "dasda",
          description: "diasjdad",
          gender: "dasda",
          author_id: 1,
          publish_date: Time.new,
          publishing_company: "Testest"
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
      response(422, 'unprocessable entity') do
        let(:book) { {
          title: "dasda",
          description: "diasjdad",
          gender: "dasda",
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

  path '/books/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show book') do
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

    patch('update book') do
      consumes "application/json"
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          gender: { type: :string },
          author_id: { type: :integer },
          publish_date: { type: :datetime },
          publishing_company: { type: :string }
        }
      }

      response(200, 'successful') do
        let(:id) { '1' }
        let(:book) { {
          title: "dasda",
          description: "diasjdad",
          gender: "dasda",
          author_id: 1,
          publish_date: Time.new,
          publishing_company: "Testest"
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

    put('update book') do
      consumes "application/json"
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          gender: { type: :string },
          author_id: { type: :integer },
          publish_date: { type: :datetime },
          publishing_company: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { '1' }
        let(:book) { {
          title: "dasda",
          description: "diasjdad",
          gender: "dasda",
          author_id: 1,
          publish_date: Time.new,
          publishing_company: "Testest"
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

    delete('delete book') do
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
