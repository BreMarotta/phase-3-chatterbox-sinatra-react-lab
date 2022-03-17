class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    messages = Message.created_at_order
    messages.to_json
  end

  post '/messages' do 
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find_by(id: params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find_by(id: params[:id])
    message.destroy
    message.to_json
  end
end
