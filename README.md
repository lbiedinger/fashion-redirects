# Europeana Fashion Redirects

Sinatra app to handle redirects for Europeana Fashion URLs

## Configuration

Fashion hashes and equivalent Europeana record IDs are expected to be stored in
PostgreSQL.

Set the environment variable `DATABASE_URL` to the URL of the PostgreSQL
database, e.g. `DATABASE_URL="postgres://fashion@localhost/fashion_redirects"`

Initialise the database with `bundle exec rake db:setup`.


To seed this database from the Europeana Search/Record API, use the script
[bin/seed](bin/seed).

## Usage

Start the app using Puma: `bundle exec puma -C config/puma.rb`

## License

Licensed under the EUPL V.1.1.

For full details, see [LICENSE.md](LICENSE.md).
