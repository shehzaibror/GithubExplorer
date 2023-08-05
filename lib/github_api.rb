# lib/github_api.rb
require 'httparty'

class GithubApi
  include HTTParty
  base_uri 'https://api.github.com'

  def self.search_user(username)
    get("/users/#{username}")
  end

  def self.user_repositories(username)
    get("/users/#{username}/repos")
  end
end
