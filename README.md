# Europeana Fashion Redirects

Sinatra app to handle redirects for Europeana Fashion URLs

## Configuration

Fashion hashes and equivalent Europeana record IDs are expected to be stored in
MongoDB.

Set the environment variable `MONGO_URI` to the URI of the MongoDB database,
e.g. `MONGO_URI="mongodb://127.0.0.1:27017/fashion"`

To seed this database, use the script [bin/seed](bin/seed).

## Usage

Start the app using Puma: `bundle exec puma -C config/puma.rb`

## License

Licensed under the EUPL V.1.1.

For full details, see [LICENSE.md](LICENSE.md).
