# spec/integration/users_spec.rb
require 'swagger_helper'

describe 'Input or Output API' do
   
      #retrive inputandoutput for all
      path '/inputandoutput/index/' do
        get 'Retrieves all inputandoutput' do
          tags 'Input or Output'
          produces 'application/json'
    
          response '200', ' ' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                date: { type: :string },
                observation: { type: :string },
                user_id: { type: :integer },
                created_at: { type: :string },
                updated_at: { type: :string }
              }
              #example response of postman
            let(:id) { {"id":2,"date":"2019-02-06T23:36:44.216Z","observation":"Entrada","user_id":17,"created_at":"2019-02-07T16:41:31.854Z","updated_at":"2019-02-07T16:41:31.854Z"} }
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end

      #retrive inputandoutput
      path '/inputandoutput/get' do
        get 'Retrieves inputandoutput' do
          tags 'Input or Output'
          produces 'application/json'
          encoded_credentials =
          ActionController::HttpAuthentication::Token.encode_credentials('token')
          headers = { 'Authorization' => encoded_credentials }

    
          response '200', ' ' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                date: { type: :string },
                observation: { type: :string },
                user_id: { type: :integer },
                created_at: { type: :string },
                updated_at: { type: :string },
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password_digest: { type: :string },
                role: { type: :string },
                confirmation_token: { type: :string },
                confirmed_at: { type: :string },
                confirmation_sent_at: { type: :string }
              }
            #example response of postman
            let(:id) { {
                "id": 5,
                "date": "2019-02-11T22:00:19.028Z",
                "observation": "Entrada",
                "user_id": 20,
                "created_at": "2019-02-11T22:00:19.087Z",
                "updated_at": "2019-02-11T22:00:19.087Z",
                "name": "ana",
                "surname": "perez",
                "email": "ana@hotmail.com",
                "password_digest": "$2a$10$LNgy2ZljJ0BLjNsIhy0JOuyuF1iYpMhU/i2fLF2KGZ/gMnTJHIwdy",
                "role": "empleado",
                "confirmation_token": "8fce18a19c5e245385cc",
                "confirmed_at": null,
                "confirmation_sent_at": "2019-02-11T14:04:33.473Z"
            } }
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end
     #retrive inputandoutput for id
      path '/inputandoutput/getId{id}' do
        post 'Retrieves inputandoutput for id' do
          tags 'Input or Output'
          produces 'application/json'
          encoded_credentials =
          ActionController::HttpAuthentication::Token.encode_credentials('token')
          headers = { 'Authorization' => encoded_credentials }

          parameter name: :id, in: :body, schema: {
            type: :object,
            properties: {
              id: { type: :integer }
            }
          }
    
          response '200', ' ' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                date: { type: :string },
                observation: { type: :string },
                user_id: { type: :integer },
                created_at: { type: :string },
                updated_at: { type: :string },
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password_digest: { type: :string },
                role: { type: :string },
                confirmation_token: { type: :string },
                confirmed_at: { type: :string },
                confirmation_sent_at: { type: :string }
              }
            #example response of postman
            let(:id) { {
                "id": 5,
                "date": "2019-02-11T22:00:19.028Z",
                "observation": "Entrada",
                "user_id": 20,
                "created_at": "2019-02-11T22:00:19.087Z",
                "updated_at": "2019-02-11T22:00:19.087Z",
                "name": "ana",
                "surname": "perez",
                "email": "ana@hotmail.com",
                "password_digest": "$2a$10$LNgy2ZljJ0BLjNsIhy0JOuyuF1iYpMhU/i2fLF2KGZ/gMnTJHIwdy",
                "role": "empleado",
                "confirmation_token": "8fce18a19c5e245385cc",
                "confirmed_at": null,
                "confirmation_sent_at": "2019-02-11T14:04:33.473Z"
            } }
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end

      #retrive inputandoutput for id
      path '/inputandoutput/show{id}' do
        post 'Retrieves inputandoutput for id' do
          tags 'Input or Output'
          produces 'application/json'
          encoded_credentials =
          ActionController::HttpAuthentication::Token.encode_credentials('token')
          headers = { 'Authorization' => encoded_credentials }

          parameter name: :id, in: :body, schema: {
            type: :object,
            properties: {
              id: { type: :integer }
            }
          }
    
          response '200', 'Loaded Data' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                date: { type: :string },
                observation: { type: :string },
                user_id: { type: :integer },
                created_at: { type: :string },
                updated_at: { type: :string }
              }
            #example response of postman
            let(:id) { { "data": {
                "id": 9,
                "date": "2019-02-11T23:37:28.923Z",
                "observation": "Salida",
                "user_id": 20,
                "created_at": "2019-02-11T23:37:28.959Z",
                "updated_at": "2019-02-11T23:37:28.959Z"
            }}}
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end

       #create inputandoutput
        path '/inputandoutput' do
          post 'Create a inputandoutput' do
            tags 'Input or Output'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
              type: :object,
              properties: {
                id: { type: :integer, },
                date: { type: :string },
                observation: { type: :string },
                user_id: { type: :integer }
              }
            }
      
            response '201', 'Input or Output created successfully' do
              let(:user) { {'status': 'Input or Output created successfully'} }
              run_test!
            end
      
            response '422', 'Error created input or output' do
              let(:user) { {'status': 'Error created input or output'} }
              run_test!
            end
          end
        end

         #update inputandoutput
          path '/inputandoutput/update' do
            put 'Update a inputandoutput' do
              tags 'Input or Output'
              consumes 'application/json'
              parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    id: { type: :integer, },
                    date: { type: :string },
                    observation: { type: :string },
                    user_id: { type: :integer }
                }
              }
        
              response '201', 'Updated input or output' do
                let(:user) { {'status': 'Updated input or output'} }
                run_test!
              end
        
              response '422', 'Error input or output not updated' do
                let(:user) { {'status': 'Error input or output not updated'} }
                run_test!
              end
            end
          end

          #delete inputandoutput
          path '/inputandoutput/destroy' do
            delete 'Delete a inputandoutput' do
              tags 'Input or Output'
              consumes 'application/json'
              parameter name: :id, in: :body, schema: {
                type: :object,
                properties: {
                  id: { type: :integer }
                }
              }
        
              response '201', 'Deleted input or output' do
                let(:user) { {'status': 'Deleted input or output'} }
                run_test!
              end
        
              response '422', 'Error deleted input or output' do
                let(:user) { {'status': 'Error deleted input or output'} }
                run_test!
              end
            end
          end

      #end
    end