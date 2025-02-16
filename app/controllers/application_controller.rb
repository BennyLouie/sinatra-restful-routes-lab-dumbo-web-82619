class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do

    erb :new
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post "/recipes" do
    recipe = Recipe.create(params)
    redirect to "/recipes/#{recipe.id}"
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do 
    Recipe.find(params[:id]).update_attributes(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe = Recipe.find(params[:id])
    redirect to "/recipes/#{recipe.id}"
  end

  delete "/recipes/:id" do 
    Recipe.find(params[:id]).delete
    redirect to "/recipes"
  end

end
