# spec/integration/users_spec.rb
require 'swagger_helper'

describe 'Users API' do
   
      #retrive users for all
      path '/users/index/' do
        get 'Retrieves all users' do
          tags 'Users'
          produces 'application/json'
    
          response '200', ' ' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password_digest: { type: :string },
                role: { type: :string },
                confirmation_token: { type: :string },
                confirmed_at: { type: :string },
                confirmation_sent_at: { type: :string },
                created_at: { type: :string },
                updated_at: { type: :string }
              }
              #example response of postman
            let(:id) { {"id":17,"name":"pablo","surname":" perez","email":"pablo@hotmail.com","password_digest":"$2a$10$AoFogvOrAODXj1Xwo6OyM.9ceEtHH39BCBaIJBV4UrcUlvoCXjwF6","role":"empleado","confirmation_token":"7ea95f684f290aa56b2d","confirmed_at":null,"confirmation_sent_at":"2019-02-09T22:59:10.913Z","created_at":"2019-02-09T22:59:10.913Z","updated_at":"2019-02-09T22:59:10.913Z"} }
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end
     #retrive user for role
      path '/users/get{id}' do
        post 'Retrieves users for role' do
          tags 'Users'
          produces 'application/json'
          encoded_credentials =
          ActionController::HttpAuthentication::Token.encode_credentials('token')
          headers = { 'Authorization' => encoded_credentials }

          parameter name: :id, in: :body, schema: {
            type: :object,
            properties: {
              id: { type: :string }
            }
          }
    
          response '200', ' ' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password_digest: { type: :string },
                role: { type: :string },
                confirmation_token: { type: :string },
                confirmed_at: { type: :string },
                confirmation_sent_at: { type: :string },
                created_at: { type: :string },
                updated_at: { type: :string }
              }
            #example response of postman
            let(:id) { {"id":17,"name":"pablo","surname":" perez","email":"pablo@hotmail.com","password_digest":"$2a$10$AoFogvOrAODXj1Xwo6OyM.9ceEtHH39BCBaIJBV4UrcUlvoCXjwF6","role":"empleado","confirmation_token":"7ea95f684f290aa56b2d","confirmed_at":null,"confirmation_sent_at":"2019-02-09T22:59:10.913Z","created_at":"2019-02-09T22:59:10.913Z","updated_at":"2019-02-09T22:59:10.913Z"} }
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end
      #retrive user for id
      path '/users/show{id}' do
        post 'Retrieves users for id' do
          tags 'Users'
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
    
          response '200', 'Loaded User' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password_digest: { type: :string },
                role: { type: :string },
                confirmation_token: { type: :string },
                confirmed_at: { type: :string },
                confirmation_sent_at: { type: :string },
                created_at: { type: :string },
                updated_at: { type: :string }
              }
            #example response of postman
            let(:id) { {
              "status": "SUCCESS",
              "message": "Loaded User",
              "data": {
                  "id": 17,
                  "name": "pablo",
                  "surname": " perez",
                  "email": "pablo@hotmail.com",
                  "password_digest": "$2a$10$AoFogvOrAODXj1Xwo6OyM.9ceEtHH39BCBaIJBV4UrcUlvoCXjwF6",
                  "role": "empleado",
                  "confirmation_token": "7ea95f684f290aa56b2d",
                  "confirmed_at": null,
                  "confirmation_sent_at": "2019-02-09T22:59:10.913Z",
                  "created_at": "2019-02-09T22:59:10.913Z",
                  "updated_at": "2019-02-09T22:59:10.913Z"
              } }}
            run_test!
          end
    
          response '404', 'Error in load' do
            let(:id) { {'status': 'Error in load'} }
            run_test!
          end
        end
      end

       #create users
        path '/users' do
          post 'Create a user' do
            tags 'Users'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
              type: :object,
              properties: {
                name: { type: :string },
                surname: { type: :string },
                email: { type: :string },
                password: { type: :string },
                password_confirmation: { type: :string },
                role: { type: :string }
              }
            }
      
            response '201', 'User created successfully' do
              let(:user) { {'status': 'User created successfully'} }
              run_test!
            end
      
            response '422', 'invalid request' do
              let(:user) { {'status': 'Error created user'} }
              run_test!
            end
          end
        end

         #update users
          path '/users/update' do
            put 'Update a user' do
              tags 'Users'
              consumes 'application/json'
              parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                  name: { type: :string },
                  surname: { type: :string },
                  email: { type: :string },
                  password: { type: :string },
                  password_confirmation: { type: :string },
                  role: { type: :string }
                }
              }
        
              response '201', 'Updated user' do
                let(:user) { {'status': 'Updated user'} }
                run_test!
              end
        
              response '422', 'invalid request' do
                let(:user) { {'status': 'Error user not updated'} }
                run_test!
              end
            end
          end

          #delete users
          path '/users/destroy' do
            delete 'Delete a user' do
              tags 'Users'
              consumes 'application/json'
              parameter name: :id, in: :body, schema: {
                type: :object,
                properties: {
                  id: { type: :integer }
                }
              }
        
              response '201', 'Deleted user' do
                let(:user) { {'status': 'Deleted user'} }
                run_test!
              end
        
              response '422', 'invalid request' do
                let(:user) { {'status': 'Error deleted user'} }
                run_test!
              end
            end
          end

           #confirm token
           path '/users/confirm' do
            post 'Confirm Token' do
              tags 'Users'
              consumes 'application/json'
              parameter name: :token, in: :body, schema: {
                type: :object,
                properties: {
                  token: { type: :string }
                }
              }
        
              response '201', 'User confirmed successfully' do
                let(:user) { {'status': 'User confirmed successfully'} }
                run_test!
              end
        
              response '422', 'Invalid token' do
                let(:user) { {'status': 'Invalid token'} }
                run_test!
              end
            end
          end

          #login users
          path '/users/login' do
            post 'Login Users' do
              tags 'Users'
              consumes 'application/json'
              parameter name: :email, name: :password, in: :body, schema: {
                type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string }
                }
              }
        
              response '201', '{auth_token: auth_token}' do
                let(:user) { {auth_token: auth_token} }
                run_test!
              end
        
              response '401', 'Invalid username / password' do
                let(:user) { {'status': 'Invalid username / password'} }
                run_test!
              end
            end
          end

          #email update users
          path '/users/email_update' do
            post 'Email user update' do
              tags 'Users'
              consumes 'application/json'
              parameter name: :token, in: :body, schema: {
                type: :object,
                properties: {
                  token: { type: :string }
                }
              }
        
              response '201', 'Email updated successfully' do
                let(:user) { {'status': 'Email updated successfully'} }
                run_test!
              end
        
              response '401', 'The email link seems to be invalid / expired. Try requesting for a new one.' do
                let(:user) { {'status': 'The email link seems to be invalid / expired. Try requesting for a new one.'} }
                run_test!
              end
            end
          end



      #end
    end