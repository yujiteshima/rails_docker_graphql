# spec/graphql/queries/users_spec.rb

require 'rails_helper'

RSpec.describe "Users Query", type: :request do
  let!(:user1) { User.create!(name: "Alice") }
  let!(:user2) { User.create!(name: "Bob") }

  let(:query) do
    <<~GRAPHQL
      {
        users {
          id
          name
          createdAt
          updatedAt
        }
      }
    GRAPHQL
  end

  it "全てのユーザーを取得できること" do
    post "/graphql", params: { query: query }

    json = JSON.parse(response.body)
    data = json["data"]["users"]

    expect(data.length).to eq(2)
    expect(data.map { |u| u["name"] }).to contain_exactly("Alice", "Bob")
  end
end
