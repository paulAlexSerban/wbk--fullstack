# The Chinook sample database contains 11 tables, as follows:

- `employees` table stores employee data such as id, last name, first name, etc. It also has a field named `ReportsTo` to specify who reports to whom.
- customers table stores customer data.
- `invoices` & `invoice_items` tables: these two tables store invoice data. The invoices table stores invoice header data and the `invoice_items` table stores the invoice line items data.
- `artist`s table stores artist data. It is a simple table that contains the id and name.
- `albums` table stores data about a list of tracks. Each album belongs to one artist, but an artist may have multiple albums.
- `media_types` table stores media types such as MPEG audio and AAC audio files.
- `genres` table stores music types such as rock, jazz, metal, etc.
- `tracks` table stores the data of songs. Each track belongs to one album.
- `playlists` & `playlist_track` tables: `playlists` table stores data about playlists. Each playlist contains a list of tracks. Each track may belong to multiple playlists. The relationship between the - `playlists` and tracks tables is many-to-many. The `playlist_track` table is used to reflect this relationship.
