# app/controllers/home_controller.rb
require 'github_api'

class HomeController < ApplicationController
  def index; end

  def show
    username = params[:username]

    # Fetch user data from GitHub API
    user_data = GithubApi.search_user(username)

    if user_data['message'] == 'Not Found'
      flash[:danger] = 'GitHub user not found.'
      redirect_to root_path and return
    end

    @user = User.find_by(username: username)

    return unless @user.nil?

    @user = User.create(user_params(user_data))
    fetch_and_create_user_repositories(username)
  end

  private

  def user_params(user_data)
    # Whitelist the allowed attributes for user creation
    {
      username: user_data['login'],
      full_name: user_data['name'],
      location: user_data['location'],
      email: user_data['email'],
      followers_count: user_data['followers'],
      following_count: user_data['following'],
      bio: user_data['bio'],
      avatar_url: user_data['avatar_url']
    }
  end

  def fetch_and_create_user_repositories(username)
    # Fetch user repositories from GitHub API
    user_repos = GithubApi.user_repositories(username)
    return unless user_repos.present?

    # Use bulk insert to create repositories
    repositories_to_create = user_repos.map do |repo_data|
      {
        name: repo_data['name'],
        url: repo_data['html_url'],
        description: repo_data['description'],
        id: repo_data['id'],
        user_id: @user.id
      }
    end

    Repository.insert_all(repositories_to_create, unique_by: :id)
  end
end
