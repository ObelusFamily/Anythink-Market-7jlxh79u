// Define an environment named "local"
env "local" {
  // Define the URL of the database which is managed in
  // this environment.
  url = "postgres://postgres:@localhost:5433/anythink-market?sslmode=disable&search_path=public"

  // Define the URL of the Dev Database for this environment
  // See: https://atlasgo.io/concepts/dev-database
  dev = "postgres://postgres:pass@localhost:5437/?sslmode=disable&search_path=public"

  // The schemas in the database that are managed by Atlas.
  // TODO: FIX!
  //schemas = ["public"]
}