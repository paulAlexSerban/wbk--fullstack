#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

NEW_WP_SITE_NAME="Hello Wordpress Business Site"
NEW_WP_SITE_SLUG="hello-wordpress-business-site"

# copy ./hello-wordpress/* to $NEW_WP_SITE_SLUG
cp -r ./hello-wordpress/* ./$NEW_WP_SITE_SLUG

# find and replace text hello-wordpress with $NEW_WP_SITE_SLUG
find ./$NEW_WP_SITE_SLUG -type f -exec sed -i "s/hello-wordpress/$NEW_WP_SITE_SLUG/g" {} \;
find ./$NEW_WP_SITE_SLUG -type f -exec sed -i "s/Hello Wordpress/$NEW_WP_SITE_NAME/g" {} \;

# find and replace directories hello-wordpress-* to $NEW_WP_SITE_SLUG-*
find ./$NEW_WP_SITE_SLUG -type d -name "*hello-wordpress*" -exec bash -c 'mv "$1" "${1/hello-wordpress/$NEW_WP_SITE_SLUG}"' _ {} \;

# find and replace files hello-wordpress.sql to $NEW_WP_SITE_SLUG.sql
find ./$NEW_WP_SITE_SLUG -type f -name "*hello-wordpress*" -exec bash -c 'mv "$1" "${1/hello-wordpress/$NEW_WP_SITE_SLUG}"' _ {} \;

# find and replace .env file .hello-wordpress.compose.env to .$NEW_WP_SITE_SLUG.compose.env
mv ./$NEW_WP_SITE_SLUG/configuration/env/.hello-wordpress.compose.env ./$NEW_WP_SITE_SLUG/configuration/env/.$NEW_WP_SITE_SLUG.compose.env
mv ./$NEW_WP_SITE_SLUG/configuration/env/.hello-wordpress.compose.env.example ./$NEW_WP_SITE_SLUG/configuration/env/.$NEW_WP_SITE_SLUG.compose.env.example