Rails.application.routes.draw do
  # GraphQLエンドポイント
  post "/graphql", to: "graphql#execute"
  
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end

