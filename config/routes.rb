Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get "/home/about" => "homes#about"
  resources "books" do
    resource "favorites", only: [:create, :destroy]
    resources "book_comments", only: [:create, :destroy]
  end
  resources "users" do
    resource "relationships", only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  get "search" => "searches#search"
end
